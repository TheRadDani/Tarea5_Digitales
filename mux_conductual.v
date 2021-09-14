module mux_conductual(
    input clk,
    input reset_L,
    input selector,//bit de seleccion
    input [1:0] data_in0,//entradad de datos 0
    input [1:0] data_in1,//entrada de datos 1
    output reg [1:0] data_out_c);//salida como bus de dos bits
reg [1:0] x;
always@(*) begin
    if(selector==1) x=data_in1;
    else if(selector==0) x=data_in0; 
    end
always@(posedge clk)  //funcionamineto como flip-flop dincronizado por flanco positivo de reloj
                begin 
                    if (reset_L==1) data_out_c<=x;//si el selector esta en 1, el mux de en medio funciona como buffer hasta el flip-flop
                    else if(reset_L==0) data_out_c<=2'b00;//segun enunciado, en este caso, el mux dos estara con su salida en 0 
                end
endmodule