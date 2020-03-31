`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2020 07:37:18 PM
// Design Name: 
// Module Name: ImmGen
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
module ImmGen( InstCode, ImmOut  );
    input [31:0] InstCode;
    output [31:0] ImmOut;
    
    reg [31:0] ImmOut;
    
    always@(InstCode) begin
        case(InstCode[6:0])
            7'b0000011 : ImmOut = {InstCode[31] ? {20{1'b1}} : 20'b0, InstCode[31:20]};
            7'b0010011 : ImmOut = {InstCode[31] ? {20{1'b1}} : 20'b0, InstCode[31:20]};
            7'b0100011 : ImmOut = {InstCode[31] ? {20{1'b1}} : 20'b0, InstCode[31:25], InstCode[11:7]};
            7'b0010111 : ImmOut = {InstCode[31:12], 12'b0};
            default : ImmOut = 32'b0;
        endcase
    end 
endmodule
