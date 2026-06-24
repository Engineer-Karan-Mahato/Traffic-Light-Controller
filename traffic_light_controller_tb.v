module traffic_light_controller_tb;
    parameter RED_TIME = 5;
    parameter GREEN_TIME = 4;
    parameter YELLOW_TIME = 2;

    reg clk;
    reg rst;

    wire red;
    wire green;
    wire yellow;

    traffic_light_controller #(
        .RED_TIME(RED_TIME),
        .GREEN_TIME(GREEN_TIME),
        .YELLOW_TIME(YELLOW_TIME)
    ) dut (
        .clk(clk), 
        .rst(rst),
        .red(red), 
        .green(green),
        .yellow(yellow)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("traffic_light_controller_dump.vcd");
        $dumpvars(0, traffic_light_controller_tb);

        clk = 0;
        rst = 0;
        #20;
        rst = 1;

        #200;
        $finish;
    end
endmodule