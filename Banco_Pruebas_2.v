`timescale 1ns/100ps
`include "mux_conductual.v"
`include "synth.v"
`include "probador.v"
module Banco_Pruebas_2;
wire clk;
wire reset_L;
wire selector;
wire [1:0] data_in0;
wire [1:0] data_in1;
wire [1:0] data_out_c;
wire [1:0] data_out_synth_c;
wire [1:0] data_out_synth_rtl;
wire [5:0] contador_c;
mux_conductual mux_c(
					.data_out_c	(data_out_c[1:0]),
					.clk		    (clk),
					.reset_L		(reset_L),
					.selector	(selector),
					.data_in0	(data_in0[1:0]),
					.data_in1	(data_in1[1:0]));
synth_rtl sth1(
			.data_out_c	(data_out_synth_rtl[1:0]),
			.clk		    (clk),
			.reset_L		(reset_L),
			.selector		(selector),
			.data_in0		(data_in0[1:0]),
			.data_in1		(data_in1[1:0]));
synth_cmos sth2(
			.data_out_c	(data_out_synth_c[1:0]),
			.clk		    (clk),
			.reset_L		(reset_L),
			.selector		(selector),
			.data_in0		(data_in0[1:0]),
			.data_in1		(data_in1[1:0]));
test_bench_2 tb2(
				.clk			    (clk),
				.reset_L		    (reset_L),
				.selector		(selector),
				.data_in0		(data_in0[1:0]),
				.data_in1		(data_in1[1:0]),
				.contador_c 	(contador_c[5:0]),
				.data_out_synth_c (data_out_synth_C[1:0]),
				.data_out_synth_rtl (data_out_synth_rtl[1:0]),
				.data_out_c		(data_out_c[1:0]));
endmodule
