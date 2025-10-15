module top_module(
    input clk,
    input load,
    input [511:0] data,
    output reg [511:0] q
);
    wire [511:0] left,right;
    assign left = {1'b0, q[511:1]} ;
    assign right = {q[510:0], 1'b0};
always @(posedge clk)
    if (load) q <= data;
    else begin
        q <= ~left & q | q ^ right;
    end
endmodule
