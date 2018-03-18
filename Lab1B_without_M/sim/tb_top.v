`timescale		1ns/1ns 

module	tb_counter;



reg	                           clk                              ;       
reg                            rst_n                            ;       
reg                            clr_n                            ;       
reg                            stop_n                           ;       
wire    [ 2: 0]                counter                          ;       




always  #5      clk    =       ~clk;


initial begin
	clk		<=		1'b1;
	rst_n	<=		1'b0;
    clr_n   <=      1'b0;
    stop_n  <=      1'b0;
	#100
	rst_n	<=		1'b1;
    clr_n   <=      1'b1;
    stop_n  <=      1'b1;
    #500
    clr_n   <=      1'b0;
    #30
    clr_n   <=      1'b1;

end


//例化
counter counter_inst(
		//system signals
        .clk                    (clk                    ),
        .rst_n                  (rst_n                  ),
		//function key
        .clr_n                  (clr_n                  ),
        .stop_n                 (stop_n                 ),
		//led output
        .counter                (counter                )
);


endmodule
