`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: COLLEGE OF VLSI
// Engineer: ABHISHEK KUMAR KUSHWAHA
// 
// Create Date: 25.03.2024 20:19:54
// Design Name: 
// Module Name: cgc
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: cgc means clock gating cell
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module cgc(
input clk, enable,rst,
output gated_clk
    );
    
reg enable_q, enable_sync, q;

//output
assign gated_clk = clk & enable_q;

//sampling eable at negative edge of clk to avoide glitches
always@(negedge clk or posedge rst)
begin
    if(rst)
    enable_q <= 1'b0;
    else
    enable_q <= enable_sync;
end

always@(negedge clk or posedge rst)
begin
    if(rst)
    begin
                  q <= 1'b0;
        enable_sync <= 1'b0;
    end
    else
    begin
                  q <= enable;
        enable_sync <= q;
    end
end


endmodule
