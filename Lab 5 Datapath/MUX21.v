`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2020 08:04:50 PM
// Design Name: 
// Module Name: MUX21
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


module MUX21( D1, D2, S, Y );

    input         S;
    input  [31:0] D1, D2;
    output [31:0] Y;
    
    assign Y = S ? D2:D1;
endmodule
