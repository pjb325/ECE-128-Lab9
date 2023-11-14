`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2023 02:10:48 PM
// Design Name: 
// Module Name: meal_seq_detect
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


module meal_seq_detect(
    input P1,
    input P2,
    input clk,
    input reset,
    output reg z
    );
    
    parameter S0 = 0 , S1 = 1 , S2 = 2 , S3 = 3 ;
reg [1:0] PS,NS ;

    always@(posedge clk or posedge reset)
        begin
            if(reset)
                PS <= S0;   
            else    
                PS <= NS ;
        end             

    always@(PS or P1 or P2)
    begin 
        case(PS)
            S0 : begin 
            z = 0 ;
            if (P1)
                NS = S1;
            else 
	           NS = S0;
            end
            S1 : begin 
            if (P1)
                NS = S2;
            else 
	           NS = S0;
            end
            S2 : begin 
            if (P1)
                NS = S2;
            else 
	           NS = S3;
            end 
            S3 : begin 
            if (P1)
                NS = S1;
            else
            begin
	           NS = S0;
	           z = 1;
	        end
            end 
        endcase
    end
    
    always @ (PS or P1 or P2)
    begin
    case (PS)
        S0 : z = 0 ;
        S1 : z = 0 ;
        S2 : z = 0 ;
        S3 :  begin
	    if (P1)
	       z = 1 ;
	    end    
    endcase
    end
    
endmodule