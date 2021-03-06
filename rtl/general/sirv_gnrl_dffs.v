 `timescale 1ns/1ps
 /*                                                                      
 Copyright 2017 Silicon Integrated Microelectronics, Inc.                
                                                                         
 Licensed under the Apache License, Version 2.0 (the "License");         
 you may not use this file except in compliance with the License.        
 You may obtain a copy of the License at                                 
                                                                         
     http://www.apache.org/licenses/LICENSE-2.0                          
                                                                         
  Unless required by applicable law or agreed to in writing, software    
 distributed under the License is distributed on an "AS IS" BASIS,       
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and     
 limitations under the License.                                          
 */                                                                      
                                                                         
                                                                         
                                                                         
//=====================================================================
//--        _______   ___
//--       (   ____/ /__/
//--        \ \     __
//--     ____\ \   / /
//--    /_______\ /_/   MICROELECTRONICS
//--
//=====================================================================
//
// Designer   : Bob Hu
//
// Description:
//  All of the general DFF and Latch modules
//
// ====================================================================

//


//
// ===========================================================================
//
// Description:
//  Verilog module sirv_gnrl DFF with Load-enable and Reset
//  Default reset value is 1
//
// ===========================================================================                                                                         

`include "../../rtl/e203_defines.v"
module sirv_gnrl_dfflrs # (
  parameter DW = 32
) (

  input               lden, 
  input      [DW-1:0] dnxt,
  output     [DW-1:0] qout,

  input               clk,
  input               rst_n
);

reg [DW-1:0] qout_r;

always @(posedge clk or negedge rst_n)
begin : DFFLRS_PROC
  if (rst_n == 1'b0)
    qout_r <= {DW{1'b1}};
  else if (lden == 1'b1)
    qout_r <= #1 dnxt;
end

assign qout = qout_r;

`ifndef FPGA_SOURCE//{
`ifndef DISABLE_SV_ASSERTION//{
//synopsys translate_off
sirv_gnrl_xchecker # (
  .DW(1)
) sirv_gnrl_xchecker(
  .i_dat(lden),
  .clk  (clk)
);
//synopsys translate_on
`endif//}
`endif//}
    

endmodule
// ===========================================================================
//
// Description:
//  Verilog module sirv_gnrl DFF with Load-enable and Reset
//  Default reset value is 0
//
// ===========================================================================

module sirv_gnrl_dfflr # (
  parameter DW = 32
) (

  input               lden, 
  input      [DW-1:0] dnxt,
  output     [DW-1:0] qout,

  input               clk,
  input               rst_n
);

reg [DW-1:0] qout_r;

always @(posedge clk or negedge rst_n)
begin : DFFLR_PROC
  if (rst_n == 1'b0)
    qout_r <= {DW{1'b0}};
  else if (lden == 1'b1)
    qout_r <= #1 dnxt;
end

assign qout = qout_r;

`ifndef FPGA_SOURCE//{
`ifndef DISABLE_SV_ASSERTION//{
//synopsys translate_off
sirv_gnrl_xchecker # (
  .DW(1)
) sirv_gnrl_xchecker(
  .i_dat(lden),
  .clk  (clk)
);
//synopsys translate_on
`endif//}
`endif//}
    

endmodule
// ===========================================================================
//
// Description:
//  Verilog module sirv_gnrl DFF with Load-enable, no reset 
//
// ===========================================================================

module sirv_gnrl_dffl # (
  parameter DW = 32
) (

  input               lden, 
  input      [DW-1:0] dnxt,
  output     [DW-1:0] qout,

  input               clk 
);

reg [DW-1:0] qout_r;

always @(posedge clk)
begin : DFFL_PROC
  if (lden == 1'b1)
    qout_r <= #1 dnxt;
end

assign qout = qout_r;

`ifndef FPGA_SOURCE//{
`ifndef DISABLE_SV_ASSERTION//{
//synopsys translate_off
sirv_gnrl_xchecker # (
  .DW(1)
) sirv_gnrl_xchecker(
  .i_dat(lden),
  .clk  (clk)
);
//synopsys translate_on
`endif//}
`endif//}
    

endmodule

// ===========================================================================
//
// Description:
//  Verilog module sirv_gnrl DFF with Reset, no load-enable
//  Default reset value is 0
//
// ===========================================================================

module sirv_gnrl_dffr # (
  parameter DW = 32
) (

  input      [DW-1:0] dnxt,
  output     [DW-1:0] qout,

  input               clk,
  input               rst_n
);

reg [DW-1:0] qout_r;

always @(posedge clk or negedge rst_n)
begin : DFFR_PROC
  if (rst_n == 1'b0)
    qout_r <= {DW{1'b0}};
  else                  
    qout_r <= #1 dnxt;
end

assign qout = qout_r;

endmodule

