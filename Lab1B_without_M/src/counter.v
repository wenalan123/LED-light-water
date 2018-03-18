module  counter(
		//system signals
        input                  clk                      ,//50Mhz系统时钟
        input                  rst_n                    ,//系统复位
		//function key
        input                  clr_n                    ,//clr_n=0时，清零（异步）
        input                  stop_n                   ,//stop_n=0时，暂停计数（异步）
		//led output
        output  reg   [ 2: 0]  counter 
);
//=====================================================================\
// ********** Define Parameter and Internal Signals *************
//=====================================================================/
reg     [25: 0]                clk_cnt                          ; 
reg                            clk_1hz                          ; 
reg                            M                                ; 

//======================================================================
// ***************      Main    Code    ****************
//======================================================================
always  @(posedge clk or negedge rst_n) begin
        if(rst_n == 1'b0)
            clk_cnt     <=      'd0;
        else if(clk_cnt == 'd24_999_999)  //时钟是50Mhz的，这样分频后得到的就是1hz的了
            clk_cnt     <=      'd0;
        else
            clk_cnt     <=      clk_cnt + 1'b1;
end
//clk_1hz   
always  @(posedge clk or negedge rst_n) begin
        if(rst_n == 1'b0)
            clk_1hz     <=      1'b0;
        else if(clk_cnt == 'd24_999_999)
            clk_1hz     <=      ~clk_1hz;
end

//M   相当于一个标志信号
always  @(posedge clk_1hz or negedge rst_n or negedge clr_n) begin
        if(rst_n == 1'b0)
            M       <=      1'b1;
        else if(clr_n == 1'b0)  // 清零后回到初始状态，从递增开始
            M       <=      1'b1;
        else if(counter == 'd6)
            M       <=      1'b0;
        else if(counter == 'd1)
            M       <=      1'b1;
end




//counter
always  @(posedge clk_1hz or negedge rst_n or negedge clr_n or negedge stop_n) begin
        if(rst_n == 1'b0)  //系统复位
            counter     <=      3'b000;
        else if(clr_n == 1'b0)
            counter     <=      3'b000;//clr_n=0时，清零（异步）
        else if(stop_n == 1'b0) //stop_n=0时，暂停计数（异步）
           counter      <=      counter;
        else if(M == 1'b1)  //M=1时，递增计数
           counter      <=      counter + 1'b1;
        else if(M == 1'b0)  //M=0时，递减计数
           counter      <=      counter - 1'b1; 
end


endmodule
