`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2019 08:44:23 PM
// Design Name: 
// Module Name: fifoReadTest
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


module fifoReadTest(
    input clk,
    output [15:0] data,
    
    input fifoEmpty,
    input [15:0] fifoData,
    output fifoRd
    );
    
assign fifoRd = fifoEmpty;
assign data = (emptyReg == 1) ? (fifoData) : 16'bz;

reg [1:0] state  = 0;
reg flag;    
reg emptyReg = 0;

always @(posedge clk)
begin
    emptyReg <= fifoEmpty;
//    case (state)
//        0: 
//        begin
//            if(fifoEmpty == 1)
//                begin
//                    state <= 1;
//                    fifoRd <= 1;
//                end
//            else
//                begin
//                    fifoRd <= 0;            
//                end
//            flag <= 0;
//        end
//        1:
//        begin
//            fifoRd <= 0;
//            flag <= 1;
//            state <= 0;
//        end
//    endcase    
end
 
endmodule
