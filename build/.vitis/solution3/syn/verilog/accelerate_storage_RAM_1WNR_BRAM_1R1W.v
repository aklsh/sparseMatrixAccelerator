// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1 ns / 1 ps
module accelerate_storage_RAM_1WNR_BRAM_1R1W (address0, ce0, d0, we0, q0, address1, ce1, q1,  reset, clk);

parameter DataWidth = 32;
parameter AddressWidth = 5;
parameter AddressRange = 23;

input[AddressWidth-1:0] address0;
input ce0;
input[DataWidth-1:0] d0;
input we0;
output reg[DataWidth-1:0] q0;
input[AddressWidth-1:0] address1;
input ce1;
output reg[DataWidth-1:0] q1;
input reset;
input clk;

(* ram_style = "block" *)reg [DataWidth-1:0] ram0[0:AddressRange-1];

initial begin
    $readmemh("./accelerate_storage_RAM_1WNR_BRAM_1R1W.dat", ram0);

end


always @(posedge clk)  
begin 
    if (ce0) begin
        if (we0) 
            ram0[address0] <= d0; 
        q0 <= ram0[address0];
    end
end


always @(posedge clk)  
begin 
    if (ce1) begin
        q1 <= ram0[address1];
    end
end


endmodule

