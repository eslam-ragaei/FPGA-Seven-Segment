module DE10_Standard(
    input  [9:0] SW,
    output [6:0] HEX0,
    output [6:0] HEX1,
    output [6:0] HEX2,
    output [6:0] HEX3,
    output [6:0] HEX4,
    output [6:0] HEX5
);

// Wires for each HEX display
wire [6:0] hex0_seg;
wire [6:0] hex1_seg;
wire [6:0] hex2_seg;
wire [6:0] hex3_seg;
wire [6:0] hex4_seg;
wire [6:0] hex5_seg;

// Instantiate six 7-segment decoders
seven_segment u0 (.num(SW[3:0]),  .seg(hex0_seg));
seven_segment u1 (.num(SW[7:4]),  .seg(hex1_seg));
seven_segment u2 (.num(4'd0),     .seg(hex2_seg)); // blank
seven_segment u3 (.num(4'd0),     .seg(hex3_seg)); // blank
seven_segment u4 (.num(4'd0),     .seg(hex4_seg)); // blank
seven_segment u5 (.num(4'd0),     .seg(hex5_seg)); // blank

// Connect wires to HEX outputs
assign HEX0 = hex0_seg;
assign HEX1 = hex1_seg;
assign HEX2 = hex2_seg;
assign HEX3 = hex3_seg;
assign HEX4 = hex4_seg;
assign HEX5 = hex5_seg;

endmodule
