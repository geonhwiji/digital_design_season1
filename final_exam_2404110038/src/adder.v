`timescale 1ns / 1ps

module adder (
    clk,
    rst_n,
    in1,
    in2,
    in3,
    in4,
    out
);

input wire clk;
input wire rst_n;
input wire [15:0] in1;
input wire [15:0] in2;
input wire [15:0] in3;
input wire [15:0] in4;
output reg [17:0] out;

reg [16:0] temp_add1_stage1;
reg [16:0] temp_add2_stage2;
reg [17:0] final_sum_stage3;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        temp_add1_stage1 <= 17'b0;
    else
        temp_add1_stage1 <= in1 + in2;
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        temp_add2_stage2 <= 17'b0;
    else
        temp_add2_stage2 <= in3 + in4;
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        final_sum_stage3 <= 18'b0;
    else
        final_sum_stage3 <= temp_add1_stage1 + temp_add2_stage2;
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        out <= 18'b0;
    else
        out <= final_sum_stage3;
end

endmodule

