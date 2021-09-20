module BUF(A, Y);
input A;
output Y;                    
assign #(6:6:6,6:6:6) Y = A;
endmodule            
//https://www.digikey.com/en/products/detail/advanced-micro-devices/AM2965PC/12120948
module NOT(A, Y);
input A;
output Y;
assign #(6:6:9,6:6:6) Y = ~A;
endmodule
//https://www.digikey.com/en/products/detail/advanced-micro-devices/AM2965PC/12120948
module NAND(A, B, Y);
input A, B;
output Y;
assign #(7:7:17.5,7:7:17.5) Y = ~(A & B);
endmodule
//https://www.digikey.com/en/products/detail/onsemi/NL17SZ10DBVT1G/13901520
module NOR(A, B, Y);
input A, B;
output Y;
assign #(12.5:12.5:14.8,12.5:12.5:14.8) Y = ~(A | B);
endmodule
//https://rocelec.widen.net/view/pdf/s5arda34mp/ONSM-S-A0000086116-1.pdf?t.download=true&u=5oefqw
module DFF(C, D, Q);
input C, D;
output reg Q;
always @(posedge C)
	#4.9 Q <= D;
endmodule
//https://www.digikey.com/en/products/detail/nxp-usa-inc/74AHC1G79GW-Q100125/12118573
//no usado
module DFFSR(C, D, Q, S, R);
input C, D, S, R;
output reg Q;
always @(posedge C, posedge S, posedge R)     
	if (S)
		Q <= 1'b1;
	else if (R)
		Q <= 1'b0;
	else
		Q <= D;
endmodule