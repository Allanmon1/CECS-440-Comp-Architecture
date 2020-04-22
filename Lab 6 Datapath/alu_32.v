`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineers:      Allan Montalvo, Lenin Munoz, Omar Aquino Pineda
// 
// Create Date:    03/23/2020
// Module Name:    alu_32
// Project Name:   this 32-bit ALU will be used to perform various manipulations
//		           on 16 bit integers. There are 4 "op" inputs to perform up to 
//		           16 basic operations.
//////////////////////////////////////////////////////////////////////////////////
module alu_32(A_in, B_in, ALU_Sel, ALU_Out, Carry_Out, Zero, Overflow);

//Define I/O ports
	input  [31:0] A_in, B_in;
	input  [ 3:0] ALU_Sel;
	output [31:0] ALU_Out;
	output        Overflow, Zero, Carry_Out;
	
	reg    [31:0] ALU_Out, temp;
	reg           Overflow, Zero, Carry_Out;
	wire slt1, slt2, slt3;

// Describe ALU behaviour 
	always @(*) begin
		case (ALU_Sel)
		    4'b0000: {Carry_Out, ALU_Out} = {1'b0, A_in & B_in};     // logic and
		    4'b0001: {Carry_Out, ALU_Out} = {1'b0, A_in | B_in};     // logic or
			4'b0010: if( (A_in[31] == 1'b1) | (B_in[31] == 1'b1)) begin
			             ALU_Out = $signed(A_in) + $signed(B_in);    // add signed
			             {Carry_Out, temp} = A_in + B_in;
			         end
			         else
			             {Carry_Out, ALU_Out} =  A_in + B_in;        // add unsinged
			4'b0110: if( (A_in[31] == 1'b1) | (B_in[31] == 1'b1))begin 
			             ALU_Out = $signed(A_in) - $signed(B_in);    // subtract signed
			             {Carry_Out, temp} = A_in - B_in;
			         end
			         else
			             {Carry_Out, ALU_Out} =  A_in - B_in;        // substract unsinged
			4'b0111: {Carry_Out, ALU_Out} = {31'b0, slt1 | slt2 | slt3};    // less than a < b
			4'b1100: {Carry_Out, ALU_Out} = {1'b0, ~(A_in | B_in)};  // logic nor
			4'b1111: {Carry_Out, ALU_Out} = {31'b0, A_in == B_in};   // equal comparison
			default: {Carry_Out, ALU_Out} = {1'b0,A_in};          // pass S for default
		endcase
	   	
		// handle last two status flags
        Overflow = (ALU_Sel == 4'b0110 && (A_in[31] != B_in[31]) && (A_in [31] != ALU_Out [31])) ||
                   (ALU_Sel == 4'b0010 && (A_in[31] == B_in[31]) && (A_in [31] != ALU_Out [31]));    
		if (ALU_Out == 32'b0)
			Zero = 1'b1;
		else 
			Zero = 1'b0;
				
	end // end always
    assign slt1 = ((A_in[31]==1'b0 && B_in[31] == 1'b0) && A_in < B_in); // both a and b are positvie
    assign slt2 = ((A_in[31]==1'b1 && B_in[31] == 1'b1) && A_in > B_in); // both a and b are negative
    assign slt3 = (A_in[31] != B_in[31] && A_in[31] == 1);           // a and b differ 
    
endmodule
