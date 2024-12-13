`timescale 1ns / 1ps

module tb_adder;

    reg clk;
    reg rst_n;
    reg [15:0] in1;
    reg [15:0] in2;
    reg [15:0] in3;
    reg [15:0] in4;
    wire [17:0] out;

   adder uut (
        .clk(clk),
        .rst_n(rst_n),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .in4(in4),
        .out(out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst_n = 0;
        in1 = 16'd0;
        in2 = 16'd0;
        in3 = 16'd0;
        in4 = 16'd0;

        #10 rst_n = 1;

        #30;
        in1 = 16'd1111;
        in2 = 16'd1111;
        in3 = 16'd1111;
        in4 = 16'd1111;

        #10;
        in1 = 16'd3333;
        in2 = 16'd3333;
        in3 = 16'd3333;
        in4 = 16'd3333;

        #10;
        in1 = 16'd5555;
        in2 = 16'd5555;
        in3 = 16'd5555;
        in4 = 16'd5555;

        #140;
        rst_n = 0;

        #100;
        $finish;
    end

endmodule

