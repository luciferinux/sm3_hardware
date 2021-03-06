//address decode
module ADDR_DECODER(ENABLE,AHB_HSEL,AHB_HWRITE,REG_ADDR);
output [12:0] ENABLE;
input         AHB_HSEL,AHB_HWRITE;
input  [3:0]  REG_ADDR;
assign ENABLE[0]=AHB_HSEL&AHB_HWRITE&~REG_ADDR[3]&~REG_ADDR[2]&~REG_ADDR[1]&~REG_ADDR[0];
assign ENABLE[1]=AHB_HSEL&AHB_HWRITE&~REG_ADDR[3]&~REG_ADDR[2]&~REG_ADDR[1]&REG_ADDR[0];
assign ENABLE[2]=AHB_HSEL&AHB_HWRITE&~REG_ADDR[3]&~REG_ADDR[2]&REG_ADDR[1]&~REG_ADDR[0];
assign ENABLE[3]=AHB_HSEL&AHB_HWRITE&~REG_ADDR[3]&~REG_ADDR[2]&REG_ADDR[1]&REG_ADDR[0];
assign ENABLE[4]=AHB_HSEL&AHB_HWRITE&~REG_ADDR[3]&REG_ADDR[2]&~REG_ADDR[1]&~REG_ADDR[0];
assign ENABLE[5]=AHB_HSEL&AHB_HWRITE&~REG_ADDR[3]&REG_ADDR[2]&~REG_ADDR[1]&REG_ADDR[0];
assign ENABLE[6]=AHB_HSEL&AHB_HWRITE&~REG_ADDR[3]&REG_ADDR[2]&REG_ADDR[1]&~REG_ADDR[0];
assign ENABLE[7]=AHB_HSEL&AHB_HWRITE&~REG_ADDR[3]&REG_ADDR[2]&REG_ADDR[1]&REG_ADDR[0];
assign ENABLE[8]=AHB_HSEL&AHB_HWRITE&REG_ADDR[3]&~REG_ADDR[2]&~REG_ADDR[1]&~REG_ADDR[0];
assign ENABLE[9]=AHB_HSEL&AHB_HWRITE&REG_ADDR[3]&~REG_ADDR[2]&~REG_ADDR[1]&REG_ADDR[0];
assign ENABLE[10]=AHB_HSEL&AHB_HWRITE&REG_ADDR[3]&~REG_ADDR[2]&REG_ADDR[1]&~REG_ADDR[0];
assign ENABLE[11]=AHB_HSEL&AHB_HWRITE&REG_ADDR[3]&~REG_ADDR[2]&REG_ADDR[1]&REG_ADDR[0];
assign ENABLE[12]=AHB_HSEL&AHB_HWRITE&REG_ADDR[3]&REG_ADDR[2]&~REG_ADDR[1]&~REG_ADDR[0];
endmodule

//REG
module REG(ENABLE,LAST_RES,SAR_ADDR,BSR,CRYPT_INTR,AHB_HRDATA,TEMP_RES,AHB_HRESETN,AHB_HCLK,AHB_HADDR,AHB_HSEL,AHB_HWRITE,SET_STR,AHB_HWDATA);
output          ENABLE,CRYPT_INTR;
output [12:0]   SAR_ADDR,BSR;
output [31:0]   AHB_HRDATA;
output [255:0]  LAST_RES;
input           AHB_HRESETN,AHB_HCLK,AHB_HSEL,AHB_HWRITE;
input           SET_STR;
input  [5:2]    AHB_HADDR;
input  [31:0]   AHB_HWDATA;
input  [255:0]  TEMP_RES;
wire            ENR0,STR0,IMR0;
wire   [12:0]   ENABLE_D, ENABLE_M;
assign ENABLE_M[0] = AHB_HSEL&~AHB_HADDR[5]&~AHB_HADDR[4]&~AHB_HADDR[3]&~AHB_HADDR[2];
assign ENABLE_M[1] = AHB_HSEL&~AHB_HADDR[5]&~AHB_HADDR[4]&~AHB_HADDR[3]&AHB_HADDR[2];
assign ENABLE_M[2] = AHB_HSEL&~AHB_HADDR[5]&~AHB_HADDR[4]&AHB_HADDR[3]&~AHB_HADDR[2];
assign ENABLE_M[3] = AHB_HSEL&~AHB_HADDR[5]&~AHB_HADDR[4]&AHB_HADDR[3]&AHB_HADDR[2];
assign ENABLE_M[4] = AHB_HSEL&~AHB_HADDR[5]&AHB_HADDR[4]&~AHB_HADDR[3]&~AHB_HADDR[2];
assign ENABLE_M[5] = AHB_HSEL&~AHB_HADDR[5]&AHB_HADDR[4]&~AHB_HADDR[3]&AHB_HADDR[2];
assign ENABLE_M[6] = AHB_HSEL&~AHB_HADDR[5]&AHB_HADDR[4]&AHB_HADDR[3]&~AHB_HADDR[2];
assign ENABLE_M[7] = AHB_HSEL&~AHB_HADDR[5]&AHB_HADDR[4]&AHB_HADDR[3]&AHB_HADDR[2];
assign ENABLE_M[8] = AHB_HSEL&AHB_HADDR[5]&~AHB_HADDR[4]&~AHB_HADDR[3]&~AHB_HADDR[2];
assign ENABLE_M[9] = AHB_HSEL&AHB_HADDR[5]&~AHB_HADDR[4]&~AHB_HADDR[3]&AHB_HADDR[2];
assign ENABLE_M[10] = AHB_HSEL&AHB_HADDR[5]&~AHB_HADDR[4]&AHB_HADDR[3]&~AHB_HADDR[2];
assign ENABLE_M[11] = AHB_HSEL&AHB_HADDR[5]&~AHB_HADDR[4]&AHB_HADDR[3]&AHB_HADDR[2];
assign ENABLE_M[12] = AHB_HSEL&AHB_HADDR[5]&AHB_HADDR[4]&~AHB_HADDR[3]&~AHB_HADDR[2];
assign CRYPT_INTR=~IMR0&STR0;
assign ENABLE=ENR0;
ADDR_DECODER    addr_decoder(ENABLE_D,AHB_HSEL,AHB_HWRITE,AHB_HADDR);
SDFFldR_1       enr(ENR0,AHB_HWDATA[0],AHB_HCLK,ENABLE_D[0],AHB_HRESETN);
SDFFldR_13      sar(SAR_ADDR,AHB_HWDATA[12:0],AHB_HCLK,ENABLE_D[1],AHB_HRESETN);
SDFFldR_13      bsr(BSR,AHB_HWDATA[12:0],AHB_HCLK,ENABLE_D[2],AHB_HRESETN);
SDFFldR_1       imr(IMR0,STR0,AHB_HCLK,ENABLE_D[3],AHB_HRESETN);
SDFFldR_1       str(STR0,SET_STR,AHB_HCLK,ENABLE_D[4],AHB_HRESETN);
SDFFldR_32      res0(LAST_RES[31:0],TEMP_RES[31:0],AHB_HCLK,ENABLE_D[5],AHB_HRESETN);
SDFFldR_32      res1(LAST_RES[63:32],TEMP_RES[63:32],AHB_HCLK,ENABLE_D[6],AHB_HRESETN);
SDFFldR_32      res2(LAST_RES[95:64],TEMP_RES[95:64],AHB_HCLK,ENABLE_D[7],AHB_HRESETN);
SDFFldR_32      res3(LAST_RES[127:96],TEMP_RES[127:96],AHB_HCLK,ENABLE_D[8],AHB_HRESETN);
SDFFldR_32      res4(LAST_RES[159:128],TEMP_RES[159:128],AHB_HCLK,ENABLE_D[9],AHB_HRESETN);
SDFFldR_32      res5(LAST_RES[191:160],TEMP_RES[191:160],AHB_HCLK,ENABLE_D[10],AHB_HRESETN);
SDFFldR_32      res6(LAST_RES[223:192],TEMP_RES[223:192],AHB_HCLK,ENABLE_D[11],AHB_HRESETN);
SDFFldR_32      res7(LAST_RES[255:224],TEMP_RES[255:224],AHB_HCLK,ENABLE_D[12],AHB_HRESETN);
MUX1313_32      mux1313_32(AHB_HRDATA,{31'b0,ENR0},{19'b0,SAR_ADDR},{19'b0,BSR},{31'b0,IMR0},{31'b0,STR0},LAST_RES[31:0],LAST_RES[63:32],LAST_RES[95:64],LAST_RES[127:96],LAST_RES[159:128],LAST_RES[191:160],LAST_RES[223:192],LAST_RES[255:224],ENABLE_M);
endmodule


  


