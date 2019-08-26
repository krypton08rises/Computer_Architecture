module bintogray(b,g)
	input [3:0]b;
	output [3:0]G;
	wire w0,w1,w2;
	b[3] = g[3];
	or(w2,b[3],b[2]);
	not(g[2],w2)
	or(w1,b[2],b[1]);
	not(g[1],w1);
	or(w0,b[1],b[0]);
	not(g[0],w0);
endmodule

module testbench;
	reg [3:0]b;
	wire [3:0]g;	
	bintogray bcd2gc (b,g);
	initial
		begin
			$monitor(,$time,"b=%d,g=%d",b,g);
			#0 b = 2'd00;
			#5 b = 2'd01;
			#10 b = 2'd02;
			#15 b = 2'd03;
			#20 b = 2'd03;
			/*
			#25 b0=1'b0;b1=1'b1;b2=1'b0;b3=1'b1;
			#30 b0=1'b0;b1=1'b1;b2=1'b1;b3=1'b0;
			#35 b0=1'b0;b1=1'b1;b2=1'b1;b3=1'b1;
			#40 b0=1'b1;b1=1'b0;b2=1'b1;b3=1'b0;
			#45 b0=1'b1;b1=1'b0;b2=1'b0;b3=1'b1;
			#50 b0=1'b1;b1=1'b0;b2=1'b1;b3=1'b0;
			#55 b0=1'b1;b1=1'b0;b2=1'b1;b3=1'b1;
			#60 b0=1'b1;b1=1'b1;b2=1'b0;b3=1'b0;
			#65 b0=1'b1;b1=1'b1;b2=1'b0;b3=1'b1;
			#70 b0=1'b1;b1=1'b1;b2=1'b1;b3=1'b0;
			#75 b0=1'b1;b1=1'b1;b2=1'b1;b3=1'b1;
			*/
			#80 $finish;
		end	
endmodule
	