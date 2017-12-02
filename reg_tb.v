`timescale 1ns/1ns
module REG_TB;
reg          AHB_HRESETN,AHB_HCLK,AHB_HSEL,AHB_HWRITE,SET_STR;
reg  [5:2]  AHB_HADDR;
reg  [31:0]  AHB_HWDATA;
reg  [255:0] TEMP_RES;
wire         ENABLE,CRYPT_INTR;
wire [255:0] LAST_TEMP;
wire [12:0]  DAR_ADDR,SAR_ADDR,BSR;
wire [1:0]   CMDR;
wire [31:0]  AHB_HRDATA;

REG reg_t(ENABLE,LAST_RES,SAR_ADDR,BSR,CRYPT_INTR,AHB_HRDATA,TEMP_RES,AHB_HRESETN,AHB_HCLK,AHB_HADDR,AHB_HSEL,AHB_HWRITE,SET_STR,AHB_HWDATA);
initial
	$monitor("At time %t,\nAHB_HADDR = %h,\nAHB_HWDATA = %h,\nAHB_HRDATA = %h", $time, AHB_HADDR, AHB_HWDATA, AHB_HRDATA);
initial
begin
	$dumpfile("reg_tb.vcd");
	$dumpvars(0, reg_t);
end
initial
  begin 
    AHB_HRESETN=1'b0;
    AHB_HCLK=1'b1;
    AHB_HSEL=1'b0;
    AHB_HWRITE=1'b0;
    SET_STR=1'b0;
    AHB_HWDATA=32'h00000001;
    AHB_HADDR=20'h00000;
    TEMP_RES = 255'h00000000_11111111_22222222_33333333_44444444_55555555_66666666_77777777;
    #10
    AHB_HRESETN=1'b1;
    AHB_HSEL=1'b1;
    AHB_HWRITE=1'b1;
    SET_STR=1'b1;
    #1
    AHB_HADDR=20'h00000;
    #20
    AHB_HADDR=AHB_HADDR+1;
    #1
    AHB_HWDATA=32'h00000001;
    #19
    AHB_HADDR=AHB_HADDR+1;
    #1
    AHB_HWDATA=32'hffffffff;
    #19
    AHB_HADDR=AHB_HADDR+1;
    #1
    AHB_HWDATA=32'hffffffff;
    #19
    AHB_HADDR=AHB_HADDR+1;
    #1
    AHB_HWDATA=32'hffffffff;    
    #19 
    AHB_HADDR=AHB_HADDR+1;
    #1
    AHB_HWDATA=32'hffffffff;
    #19
    AHB_HADDR=AHB_HADDR+1;
    #1
    AHB_HWDATA=32'hffffffff;
    #19
    AHB_HADDR=AHB_HADDR+1; 
    #1
    AHB_HWDATA=32'hffffffff;
    #19
    AHB_HADDR=AHB_HADDR+1;
    #1
    AHB_HWDATA=32'h00000001;
    #19
    AHB_HADDR=AHB_HADDR+1;
    #1
    AHB_HWDATA=32'h00000010;
    #19
    AHB_HADDR=AHB_HADDR+1;
    #1
    AHB_HWDATA=32'h00000100;
    #19
    AHB_HADDR=AHB_HADDR+1;
    #1
    AHB_HWDATA=32'h00001000;    
    #19
    AHB_HADDR=AHB_HADDR+1;
    #1
    AHB_HWDATA=32'h00010000;
    #19
    AHB_HWRITE=1'b0;
    AHB_HADDR=20'h00000;
    #20
    AHB_HADDR=AHB_HADDR+1;
    #20
    AHB_HADDR=AHB_HADDR+1;
    #20
    AHB_HADDR=AHB_HADDR+1;
    #20
    AHB_HADDR=AHB_HADDR+1;
    #20
    AHB_HADDR=AHB_HADDR+1;
    #20
    AHB_HADDR=AHB_HADDR+1;
    #20
    AHB_HADDR=AHB_HADDR+1;
    #20
    AHB_HADDR=AHB_HADDR+1;
    #20
    AHB_HADDR=AHB_HADDR+1;
    #20
    AHB_HADDR=AHB_HADDR+1;
    #20
    AHB_HADDR=AHB_HADDR+1;
    #20
    AHB_HADDR=AHB_HADDR+1;        
    #20
    $finish;
  end
  always
    #5 AHB_HCLK=~AHB_HCLK;
endmodule
    
    
    
    
