`timescale		1ns/1ns 

module	tb_top;



reg				clk			  ;
reg				rst_n	      ;





always  #5      clk    =       ~clk;


initial begin
	clk		<=		1'b1;
	rst_n	<=		1'b0;
	#100
	rst_n	<=		1'b1;

end


//例化

endmodule
