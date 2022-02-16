`include "jpeg_defines.v"

module a_tb();


    reg clk,rst; 

    initial begin          
        clk = 1'b1;    
        rst = 1'b0;
        #180 rst = 1'b1;
        #360 rst = 1'b0;
        //#300000000 $stop;
    end

    always 	#50 clk = ~clk;
/*
    initial begin
        $dumpfile("./a_tb.vcd");
        $dumpvars(0,a_tb);
        //$dumpoff;
    end 
*/

    reg [7:0] mem [1048575:0];
    initial $readmemh("../dat/test1.txt",mem);

    reg [19:0] pc;
    always@(posedge clk)begin
        if(rst)
            pc <= 0;
        else if(ai_we & ao_next)  
            pc <= pc + 1;    
    end
    
    wire        ai_we = 1;
    wire [7:0]  ai_data = mem[pc];
    wire        ao_next;

    wire        bi_next = 1;
    wire        bo_we;
    wire        bo_begin;
    wire        bo_end;
    wire [31:0] bo_data;
    wire        bo_type;
    jpeg_top jpeg_top( 
        .ai_we    ( ai_we ),
        .ao_next  ( ao_next ),
        .ai_data  ( ai_data ), 
        
        .bo_we    ( bo_we ), 
        .bi_next  ( bi_next ),   
        .bo_begin ( bo_begin ), 
        .bo_end   ( bo_end ), 
        .bo_data  ( bo_data ), 
        .bo_type  ( bo_type ),

        .clk(clk),
        .rst(rst)
    );


//-----------------------------------------------
// output sequence:
//-----------------------------------------------
// pix in block(16x16)
//    +----+----+----+----+---------+
//    | p0 | p1 | p2 | p3 | ... p15 | 
//    +----+----+----+----+---------+
//    |p16 |p17 | ......            
//    +----+----+
//    
// blocks in picture eg. 80x80
//    +----+----+----+-----------+
//    | b0 | b1 | b2 | ...    b4 |
//    +----+----+----+-----------+
//    | b5 | ...... 
//    +----+
// 
// sequence:
//   b0p0,  b0p1, ... b0p255, b1p0, ... bnp255
//-----------------------------------------------

    reg [31:0] pix_cnt;
    always@(posedge clk)begin
        if(rst)
            pix_cnt <= 0;
        else if(bo_we & bi_next)begin
            if (bo_end)
                pix_cnt <= 0;
            else begin
                pix_cnt <= pix_cnt + 1;
                if (pix_cnt[9:0] == 'd0)begin
                    $display("%d",pix_cnt);
                    //$display("%h",bo_data);
                end
            end
                
        end
    end

    wire [31:0] block = pix_cnt / 256;   
    wire [7:0]  pix   = pix_cnt % 256; 


    wire [31:0] x = block % 61 * 16 + pix % 16;     
    wire [31:0] y = block / 61 * 16 + pix / 16;    


    reg [7:0] rr [952575 : 0];
    reg [7:0] gg [952575 : 0];
    reg [7:0] bb [952575 : 0];


    always@(posedge clk)begin
        if(bi_next & bo_we)begin
            rr[y*976 + x] <= bo_data[31:24];
            gg[y*976 + x] <= bo_data[23:16];
            bb[y*976 + x] <= bo_data[15:8];
        end
    end 


    reg wr_file;
    always @(posedge clk) begin
        if(rst)
            wr_file <= 'b0;
        else 
            wr_file <= bo_we & bi_next & bo_end;
    end

    reg [31:0] clk_cnt;
    always @(posedge clk) begin
        if(rst)
            clk_cnt <= 0;
        else
            clk_cnt <= clk_cnt + 1;
    end


    integer j;
    integer file;
    always@(posedge clk)begin
        if(wr_file)begin
            file = $fopen("res.pgm","w");
            $fdisplay (file,"%s","P3");
            $fdisplay (file,"976 976");	
            $fdisplay (file,"%s","#spicec dump");
            $fdisplay (file,"255");	
            for(j=0;j<952576;j=j+1)begin
                $fdisplay (file,"%d", rr[j]);
                $fdisplay (file,"%d", gg[j]);
                $fdisplay (file,"%d", bb[j]);
            end 
            $fclose(file);
            $display("clock: %d",clk_cnt); //5542142
            $finish;
        end
    end
    

endmodule