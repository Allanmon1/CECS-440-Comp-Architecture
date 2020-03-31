`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2020 05:33:34 PM
// Design Name: 
// Module Name: FlipFlop
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FlipFlop( clk, reset, d, q );

    // input, output, and register initialization
    input        clk, reset;
    input  [7:0] d;
    output [7:0] q;
    
    reg    [7:0] q;
    
    always@(posedge clk, posedge reset) begin
        if(reset)
            q <= 8'b0;
        else
            q <= d;
    end
    
endmodule
