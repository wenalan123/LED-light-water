module  waterfall_led(
        //system signals
        input                  clk                      ,
        input                  rst_n                    ,
        //使能及输入
        input                  g1                       ,
        input                  g2                       ,
        input                  g3                       ,
		input				   clr_n					,
		input				   stop_n					,
        output  wire  [ 7: 0]  y 
);
//=====================================================================\
// ********** Define Parameter and Internal Signals *************
//=====================================================================/
wire    [ 2: 0]                counter                          ;

//======================================================================
// ***************      Main    Code    ****************
//======================================================================

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

decoder3_8  decoder3_8_inst(
        .a                      (counter                ),//输入端口a,[2:0]表示位宽
        .g1                     (g1                     ),
        .g2                     (g2                     ),
        .g3                     (g3                     ),
        .y                      (y                      )//输出端口y，[7:0]表示位宽
);


endmodule
