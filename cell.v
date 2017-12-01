`timescale 1ns/1ns
module MUX21_256(Q,D1,D2,C);
output [255:0] Q;
input  [255:0] D1,D2;
input C;
assign Q=C?D2:D1;
endmodule

module SDFFNldR_256(Q,D,CLK,ENABLE,RESET);
output [255:0] Q;
input  [255:0] D;
input CLK,ENABLE,RESET;
parameter U_DLY=1;
reg [255:0] Q;
always @(negedge CLK)
begin
if(~RESET)
  Q<=256'b0; 
else if(ENABLE)
  Q<=#U_DLY D;
else
  Q<=Q;
end
endmodule

module SDFFldR_256(Q,D,CLK,ENABLE,RESET);
output [255:0] Q;
input  [255:0] D;
input CLK,ENABLE,RESET;
parameter U_DLY=1;
reg [255:0] Q;
always @(posedge CLK)
begin
if(~RESET)
  Q<=256'b0; 
else if(ENABLE)
  Q<=#U_DLY D;
else
  Q<=Q;
end
endmodule

module HALFCLK(HCLK,CLK);
output HCLK;
input CLK;
reg HCLK;
initial
HCLK=1;
always @ (posedge CLK)
HCLK=~HCLK;
endmodule  

module SDFFldR_128(Q,D,CLK,ENABLE,RESET);
output [127:0] Q;
input  [127:0] D;
input CLK,ENABLE,RESET;
parameter U_DLY=1;
reg [127:0] Q;
always @(posedge CLK)
begin
if(~RESET)
  Q<=128'b0; 
else if(ENABLE)
  Q<=#U_DLY D;
else
  Q<=Q;
end
endmodule

module SDFFNldR_128(Q,D,CLK,ENABLE,RESET);
output [127:0] Q;
input  [127:0] D;
input CLK,ENABLE,RESET;
parameter U_DLY=1;
reg [127:0] Q;
always @(negedge CLK)
begin
if(~RESET)
  Q<=128'b0; 
else if(ENABLE)
  Q<=#U_DLY D;
else
  Q<=Q;
end
endmodule

module SDFFldR_13(Q,D,CLK,ENABLE,RESET);
output [12:0] Q;
input  [12:0] D;
input CLK,ENABLE,RESET;
reg [12:0] Q;
parameter U_DLY=1;
always @(posedge CLK)
begin
if(~RESET)
  Q<=13'b0; 
else if(ENABLE)
  Q<=#U_DLY D;
else
  Q<=Q;
end
endmodule

module SDFFldR_1(Q,D,CLK,ENABLE,RESET);
output Q;
input  D,CLK,ENABLE,RESET;
reg Q;
parameter U_DLY=1;
always @(posedge CLK)
begin
if(~RESET)
  Q<=0; 
else if(ENABLE)
  Q<=#U_DLY D;
else
  Q<=Q;
end
endmodule

module SDFFNldR_1(Q,D,CLK,ENABLE,RESET);
output Q;
input  D,CLK,ENABLE,RESET;
reg Q;
parameter U_DLY=1;
always @(negedge CLK)
begin
if(~RESET)
  Q<=0; 
else if(ENABLE)
  Q<=#U_DLY D;
else
  Q<=Q;
end
endmodule

module INC_13(Q,D);
output [12:0] Q;
input  [12:0] D;
assign Q=D+1;
endmodule

module MUX21_13(Q,D1,D2,C);
output [12:0] Q;
input  [12:0] D1,D2;
input C;
assign Q=C?D2:D1;
endmodule

module MUX21_128(Q,D1,D2,C);
output [127:0] Q;
input  [127:0] D1,D2;
input C;
assign Q=C?D2:D1;
endmodule

module SDFFldR_4(Q,D,CLK,ENABLE,RESET);
output [3:0] Q;
input  [3:0] D;
input CLK,ENABLE,RESET;
reg [3:0] Q;
parameter U_DLY=1;
always @(posedge CLK)
begin
if(~RESET)
  Q<=4'b0; 
else if(ENABLE)
  Q<=#U_DLY D;
else
  Q<=Q;
end
endmodule

module SDFFldR_32(Q,D,CLK,ENABLE,RESET);
output [31:0] Q;
input  [31:0] D;
input CLK,ENABLE,RESET;
parameter U_DLY=1;
reg [31:0] Q;
always @(posedge CLK)
begin
if(~RESET)
  Q<=32'b0; 
else if(ENABLE)
  Q<=#U_DLY D;
else
  Q<=Q;
end
endmodule

module MUX21_32(Q,D1,D2,C);
output [31:0] Q;
input  [31:0] D1,D2;
input C;
assign Q=C?D2:D1;
endmodule

module SDFFldR_2(Q,D,CLK,ENABLE,RESET);
output [1:0] Q;
input  [1:0] D;
input CLK,ENABLE,RESET;
reg [1:0] Q;
parameter U_DLY=1;
always @(posedge CLK)
begin
if(~RESET)
  Q<=2'b0; 
else if(ENABLE)
  Q<=#U_DLY D;
else
  Q<=Q;
end
endmodule

module MUX1313_32(Q,D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,C);
output [31:0] Q;
input  [31:0] D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12;
input  [12:0] C;
reg    [31:0] Q ;
always@(D0 or D1 or D2 or D3 or D4 or D5 or D6 or D7 or D8 or D9 or D10 or D11 or D12 or C)
begin
case (C)
13'b0000000000001 : Q = D0 ;
13'b0000000000010 : Q = D1 ;
13'b0000000000100 : Q = D2 ;
13'b0000000001000 : Q = D3 ;
13'b0000000010000 : Q = D4 ;
13'b0000000100000 : Q = D5 ;
13'b0000001000000 : Q = D6 ;
13'b0000010000000 : Q = D7 ;
13'b0000100000000 : Q = D8 ;
13'b0001000000000 : Q = D9 ;
13'b0010000000000 : Q = D10 ;
13'b0100000000000 : Q = D11 ;
13'b1000000000000 : Q = D12 ;
default : Q = D12 ;
endcase
end
endmodule
