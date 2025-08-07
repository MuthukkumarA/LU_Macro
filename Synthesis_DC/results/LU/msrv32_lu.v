/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in topographical mode
// Version   : T-2022.03-SP4
// Date      : Thu Feb 27 16:08:47 2025
/////////////////////////////////////////////////////////////


module msrv32_lu ( load_size_in, clk_in, load_unsigned_in, data_in, 
        iadder_1_to_0_in, ahb_resp_in, lu_output );
  input [1:0] load_size_in;
  input [31:0] data_in;
  input [1:0] iadder_1_to_0_in;
  output [31:0] lu_output;
  input clk_in, load_unsigned_in, ahb_resp_in;
  wire   N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31, N32, N33, N34,
         N35, N36, N37, N38, N39, N40, N41, N42, N43, N44, N45, N46, N47, N48,
         N49, N50, N51, N52, n45, n46, n47, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n62, n63, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n81, n82, n83, n84, n85;

  LATCHX1_LVT \lu_output_reg[31]  ( .CLK(n82), .D(N52), .Q(lu_output[31]) );
  LATCHX1_LVT \lu_output_reg[30]  ( .CLK(n82), .D(N51), .Q(lu_output[30]) );
  LATCHX1_LVT \lu_output_reg[29]  ( .CLK(n81), .D(N50), .Q(lu_output[29]) );
  LATCHX1_LVT \lu_output_reg[28]  ( .CLK(n81), .D(N49), .Q(lu_output[28]) );
  LATCHX1_LVT \lu_output_reg[27]  ( .CLK(n82), .D(N48), .Q(lu_output[27]) );
  LATCHX1_LVT \lu_output_reg[26]  ( .CLK(n81), .D(N47), .Q(lu_output[26]) );
  LATCHX1_LVT \lu_output_reg[25]  ( .CLK(n82), .D(N46), .Q(lu_output[25]) );
  LATCHX1_LVT \lu_output_reg[24]  ( .CLK(n81), .D(N45), .Q(lu_output[24]) );
  LATCHX1_LVT \lu_output_reg[23]  ( .CLK(n81), .D(N44), .Q(lu_output[23]) );
  LATCHX1_LVT \lu_output_reg[22]  ( .CLK(n81), .D(N43), .Q(lu_output[22]) );
  LATCHX1_LVT \lu_output_reg[21]  ( .CLK(n82), .D(N42), .Q(lu_output[21]) );
  LATCHX1_LVT \lu_output_reg[20]  ( .CLK(n82), .D(N41), .Q(lu_output[20]) );
  LATCHX1_LVT \lu_output_reg[19]  ( .CLK(n81), .D(N40), .Q(lu_output[19]) );
  LATCHX1_LVT \lu_output_reg[18]  ( .CLK(n81), .D(N39), .Q(lu_output[18]) );
  LATCHX1_LVT \lu_output_reg[17]  ( .CLK(n82), .D(N38), .Q(lu_output[17]) );
  LATCHX1_LVT \lu_output_reg[16]  ( .CLK(n81), .D(N37), .Q(lu_output[16]) );
  LATCHX1_LVT \lu_output_reg[15]  ( .CLK(n81), .D(N36), .Q(lu_output[15]) );
  LATCHX1_LVT \lu_output_reg[14]  ( .CLK(n82), .D(N35), .Q(lu_output[14]) );
  LATCHX1_LVT \lu_output_reg[13]  ( .CLK(n81), .D(N34), .Q(lu_output[13]) );
  LATCHX1_LVT \lu_output_reg[12]  ( .CLK(n82), .D(N33), .Q(lu_output[12]) );
  LATCHX1_LVT \lu_output_reg[11]  ( .CLK(n81), .D(N32), .Q(lu_output[11]) );
  LATCHX1_LVT \lu_output_reg[10]  ( .CLK(n82), .D(N31), .Q(lu_output[10]) );
  LATCHX1_LVT \lu_output_reg[9]  ( .CLK(n82), .D(N30), .Q(lu_output[9]) );
  LATCHX1_LVT \lu_output_reg[8]  ( .CLK(n82), .D(N29), .Q(lu_output[8]) );
  LATCHX1_LVT \lu_output_reg[7]  ( .CLK(n82), .D(N28), .Q(lu_output[7]) );
  LATCHX1_LVT \lu_output_reg[6]  ( .CLK(n82), .D(N27), .Q(lu_output[6]) );
  LATCHX1_LVT \lu_output_reg[5]  ( .CLK(n81), .D(N26), .Q(lu_output[5]) );
  LATCHX1_LVT \lu_output_reg[4]  ( .CLK(n81), .D(N25), .Q(lu_output[4]) );
  LATCHX1_LVT \lu_output_reg[3]  ( .CLK(n81), .D(N24), .Q(lu_output[3]) );
  LATCHX1_LVT \lu_output_reg[2]  ( .CLK(n82), .D(N23), .Q(lu_output[2]) );
  LATCHX1_LVT \lu_output_reg[1]  ( .CLK(n81), .D(N22), .Q(lu_output[1]) );
  LATCHX1_LVT \lu_output_reg[0]  ( .CLK(n81), .D(N21), .Q(lu_output[0]) );
  AO22X1_LVT U86 ( .A1(iadder_1_to_0_in[1]), .A2(data_in[31]), .A3(n83), .A4(
        data_in[15]), .Y(n46) );
  NAND2X0_LVT U87 ( .A1(n66), .A2(n46), .Y(n50) );
  NOR3X0_LVT U88 ( .A1(iadder_1_to_0_in[0]), .A2(load_size_in[1]), .A3(
        load_size_in[0]), .Y(n67) );
  AO22X1_LVT U89 ( .A1(iadder_1_to_0_in[1]), .A2(data_in[23]), .A3(n83), .A4(
        data_in[7]), .Y(n60) );
  INVX1_LVT U90 ( .A(load_size_in[0]), .Y(n45) );
  AO22X1_LVT U92 ( .A1(n67), .A2(n60), .A3(n76), .A4(n46), .Y(n63) );
  INVX1_LVT U93 ( .A(load_unsigned_in), .Y(n47) );
  OAI21X2_LVT U95 ( .A1(load_unsigned_in), .A2(n50), .A3(n58), .Y(n49) );
  AO21X1_LVT U96 ( .A1(load_size_in[1]), .A2(data_in[31]), .A3(n85), .Y(N52)
         );
  AO21X1_LVT U98 ( .A1(load_size_in[1]), .A2(data_in[30]), .A3(n85), .Y(N51)
         );
  AO21X1_LVT U99 ( .A1(load_size_in[1]), .A2(data_in[29]), .A3(n85), .Y(N50)
         );
  AO21X1_LVT U100 ( .A1(load_size_in[1]), .A2(data_in[28]), .A3(n85), .Y(N49)
         );
  AO21X1_LVT U101 ( .A1(load_size_in[1]), .A2(data_in[27]), .A3(n85), .Y(N48)
         );
  AO21X1_LVT U102 ( .A1(load_size_in[1]), .A2(data_in[26]), .A3(n85), .Y(N47)
         );
  AO21X1_LVT U103 ( .A1(load_size_in[1]), .A2(data_in[25]), .A3(n85), .Y(N46)
         );
  AO21X1_LVT U104 ( .A1(load_size_in[1]), .A2(data_in[24]), .A3(n85), .Y(N45)
         );
  AO21X1_LVT U105 ( .A1(load_size_in[1]), .A2(data_in[23]), .A3(n85), .Y(N44)
         );
  AO21X1_LVT U106 ( .A1(load_size_in[1]), .A2(data_in[22]), .A3(n85), .Y(N43)
         );
  AO21X1_LVT U107 ( .A1(load_size_in[1]), .A2(data_in[21]), .A3(n85), .Y(N42)
         );
  AO21X1_LVT U108 ( .A1(load_size_in[1]), .A2(data_in[20]), .A3(n85), .Y(N41)
         );
  AO21X1_LVT U109 ( .A1(load_size_in[1]), .A2(data_in[19]), .A3(n85), .Y(N40)
         );
  AO21X1_LVT U110 ( .A1(load_size_in[1]), .A2(data_in[18]), .A3(n85), .Y(N39)
         );
  AO21X1_LVT U111 ( .A1(load_size_in[1]), .A2(data_in[17]), .A3(n85), .Y(N38)
         );
  AO21X1_LVT U112 ( .A1(load_size_in[1]), .A2(data_in[16]), .A3(n49), .Y(N37)
         );
  NAND2X0_LVT U113 ( .A1(load_size_in[1]), .A2(data_in[15]), .Y(n51) );
  NAND3X0_LVT U114 ( .A1(n58), .A2(n51), .A3(n50), .Y(N36) );
  AO22X1_LVT U115 ( .A1(iadder_1_to_0_in[1]), .A2(data_in[30]), .A3(n83), .A4(
        data_in[14]), .Y(n68) );
  AOI22X1_LVT U116 ( .A1(load_size_in[1]), .A2(data_in[14]), .A3(n66), .A4(n68), .Y(n52) );
  NAND2X0_LVT U117 ( .A1(n52), .A2(n58), .Y(N35) );
  AO22X1_LVT U118 ( .A1(iadder_1_to_0_in[1]), .A2(data_in[29]), .A3(n83), .A4(
        data_in[13]), .Y(n69) );
  AOI22X1_LVT U119 ( .A1(load_size_in[1]), .A2(data_in[13]), .A3(n66), .A4(n69), .Y(n53) );
  NAND2X0_LVT U120 ( .A1(n53), .A2(n58), .Y(N34) );
  AO22X1_LVT U121 ( .A1(iadder_1_to_0_in[1]), .A2(data_in[28]), .A3(n83), .A4(
        data_in[12]), .Y(n70) );
  AOI22X1_LVT U122 ( .A1(load_size_in[1]), .A2(data_in[12]), .A3(n66), .A4(n70), .Y(n54) );
  NAND2X0_LVT U123 ( .A1(n54), .A2(n58), .Y(N33) );
  AO22X1_LVT U124 ( .A1(iadder_1_to_0_in[1]), .A2(data_in[27]), .A3(n83), .A4(
        data_in[11]), .Y(n71) );
  AOI22X1_LVT U125 ( .A1(load_size_in[1]), .A2(data_in[11]), .A3(n66), .A4(n71), .Y(n55) );
  NAND2X0_LVT U126 ( .A1(n55), .A2(n58), .Y(N32) );
  AO22X1_LVT U127 ( .A1(iadder_1_to_0_in[1]), .A2(data_in[26]), .A3(n83), .A4(
        data_in[10]), .Y(n72) );
  AOI22X1_LVT U128 ( .A1(load_size_in[1]), .A2(data_in[10]), .A3(n66), .A4(n72), .Y(n56) );
  NAND2X0_LVT U129 ( .A1(n56), .A2(n58), .Y(N31) );
  AO22X1_LVT U130 ( .A1(iadder_1_to_0_in[1]), .A2(data_in[25]), .A3(n83), .A4(
        data_in[9]), .Y(n73) );
  AOI22X1_LVT U131 ( .A1(load_size_in[1]), .A2(data_in[9]), .A3(n66), .A4(n73), 
        .Y(n57) );
  NAND2X0_LVT U132 ( .A1(n57), .A2(n58), .Y(N30) );
  AO22X1_LVT U133 ( .A1(iadder_1_to_0_in[1]), .A2(data_in[24]), .A3(n83), .A4(
        data_in[8]), .Y(n77) );
  AOI22X1_LVT U134 ( .A1(load_size_in[1]), .A2(data_in[8]), .A3(n66), .A4(n77), 
        .Y(n59) );
  NAND2X0_LVT U135 ( .A1(n59), .A2(n58), .Y(N29) );
  AO22X1_LVT U136 ( .A1(load_size_in[1]), .A2(data_in[7]), .A3(n66), .A4(n60), 
        .Y(n62) );
  OR2X1_LVT U137 ( .A1(n63), .A2(n62), .Y(N28) );
  AO222X1_LVT U140 ( .A1(n68), .A2(n76), .A3(n75), .A4(data_in[6]), .A5(n74), 
        .A6(data_in[22]), .Y(N27) );
  AO222X1_LVT U141 ( .A1(n69), .A2(n76), .A3(n75), .A4(data_in[5]), .A5(n74), 
        .A6(data_in[21]), .Y(N26) );
  AO222X1_LVT U142 ( .A1(n70), .A2(n76), .A3(n75), .A4(data_in[4]), .A5(n74), 
        .A6(data_in[20]), .Y(N25) );
  AO222X1_LVT U143 ( .A1(n71), .A2(n76), .A3(n75), .A4(data_in[3]), .A5(n74), 
        .A6(data_in[19]), .Y(N24) );
  AO222X1_LVT U144 ( .A1(n72), .A2(n76), .A3(n75), .A4(data_in[2]), .A5(n74), 
        .A6(data_in[18]), .Y(N23) );
  AO222X1_LVT U145 ( .A1(n73), .A2(n76), .A3(n75), .A4(data_in[1]), .A5(n74), 
        .A6(data_in[17]), .Y(N22) );
  AO222X1_LVT U146 ( .A1(n77), .A2(n76), .A3(n75), .A4(data_in[0]), .A5(n74), 
        .A6(data_in[16]), .Y(N21) );
  OA21X2_LVT U139 ( .A1(n67), .A2(n66), .A3(iadder_1_to_0_in[1]), .Y(n74) );
  AO221X2_LVT U138 ( .A1(n83), .A2(load_size_in[0]), .A3(n83), .A4(n67), .A5(
        load_size_in[1]), .Y(n75) );
  AND3X2_LVT U91 ( .A1(iadder_1_to_0_in[0]), .A2(n84), .A3(n45), .Y(n76) );
  INVX4_LVT U77 ( .A(ahb_resp_in), .Y(n81) );
  INVX2_LVT U79 ( .A(iadder_1_to_0_in[1]), .Y(n83) );
  INVX1_LVT U80 ( .A(load_size_in[1]), .Y(n84) );
  INVX8_LVT U78 ( .A(ahb_resp_in), .Y(n82) );
  AND2X4_LVT U84 ( .A1(load_size_in[0]), .A2(n84), .Y(n66) );
  NAND2X4_LVT U94 ( .A1(n63), .A2(n47), .Y(n58) );
  NBUFFX4_LVT U81 ( .A(n49), .Y(n85) );
endmodule

