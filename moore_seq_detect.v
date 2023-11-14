`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2023 02:49:32 PM
// Design Name: 
// Module Name: moore_seq_detect
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


module moore_seq_detect(input P1,P2,clk,reset,output reg z);

    parameter S0 = 0 , S1 = 1 , S2 = 2 , S3 = 3, S4 = 4;
    reg [2:0] PS,NS ;

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
	                    NS = S4;
                end
                S4 : begin 

                    if (P1)
                        NS = S1;
                    else 
	                    NS = S2;
                end
            endcase
        end
    always @ (PS)
    begin
    case (PS)
        S0 : z = 0 ;
        S1 : z = 0 ;
        S2 : z = 0 ;
        S3 : z = 0 ;
        S4 : z = 1 ; 
    endcase
    end

endmodule
