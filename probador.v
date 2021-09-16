module probador(
                    output reg clk,
                    output reg reset_L,
                    output reg selector,
                    output reg [0:1] data_in0,
                    output reg [0:1] data_in1,
                    output reg [5:0] contador_c,
                    input [0:1] data_out_c,
                    input [0:1] data_out_synth);    
initial begin
    $dumpfile("test_2.vcd");	// Nombre de .vcd a graficar
	$dumpvars;
    // Mensaje que se imprime en consola una vez
    $display ("\tclk,\tdata_in0,\tdata_in1,\tselector,\treset_L,\tdata_out_c,\tdata_synth,\tcontador_c"); 
    // Mensaje que se imprime en consola cada vez que un elemento de la lista cambia 
    $monitor($time,"\t%b\t%b\t%b\t%b\t%b\t%b\t%b",data_in0,data_in1,selector,reset_L,data_out_c,data_out_synth,contador_c); 
    data_in0 = 2'b00; //valor inicial de datos de entradas
    data_in1 = 2'b00; //valor inicial de datos de entradas
    reset_L = 1'b0;    //valor por defecto de entrada selector
    selector = 1'b0; //asignacion bloqueante asincronica
    contador_c = 5'b00000;
    @(posedge clk);
    reset_L<=1;
    selector<=~selector;
    data_in0 <= 2'b10;
    data_in1 <= 2'b11;
    @(posedge clk)
    data_in0 <= 2'b00;
    data_in1 <= 2'b11;
    @(posedge clk)
    data_in0 <= 2'b01;
    data_in1 <= 2'b00;
    selector <= 1;
    
    @(posedge clk)
    data_in0 <= 2'b00;
    data_in1 <= 2'b10;
    selector <= ~selector;//toogle a selector

    @(posedge clk)
    data_in0 <= 2'b01;
    data_in1 <= 2'b11;
    selector <= 0;
    
    @(posedge clk)
    data_in0 <= 2'b10;
    data_in1 <= 2'b01;
    selector <= 1;

    @(posedge clk)
    data_in0 <= 2'b10;
    data_in1 <= 2'b10;
    selector <= 0;

    @(posedge clk)
    selector <= 1;
    

    @(posedge clk)
    data_in0 <= 2'b01;
    data_in1 <= 2'b01;
    selector <= 1;

    @(posedge clk)
    data_in0 <= 2'b01;
    data_in1 <= 2'b01;
    $finish;			// Termina de almacenar se�ales
end

*/
//checker

always @(posedge clk)begin
    if(data_out_c != data_out_synth)begin
        $display("Se detecta diferencia en salida entre modulo conductural y la salida del sintetizado con tecnologia");
    end
end
    // Reloj
	initial	clk 	<= 0;			// Valor inicial al relo
	always	#10 clk 	<= ~clk;		//invertido cada 10*10ns
endmodule
//minimo de sim 4.9