module tt_um_myprocessor (
    input  wire clk,              // Clock from Tiny Tapeout
    input  wire rst_n,            // Active-low reset
    input  wire [7:0] ui_in,      // 8-bit input
    output wire [7:0] uo_out,     // 8-bit output
    );

    // Internal connections to your processor
    wire [3:0] addr_out;
    wire [7:0] instruction;
    wire [1:0] opcode;
    wire       reg_write;
    wire       pc_src;
    wire [2:0] alu_op;
    wire [7:0] data_out_source_reg1;
    wire [7:0] data_out_source_reg2;
    wire [7:0] alu_out;

    // Instantiate your processor
    processor cpu (
        .clk(clk),
        .rst(rst_n),
        .addr_out(addr_out),
        .instruction(instruction),
        .opcode(opcode),
        .reg_write(reg_write),
        .pc_src(pc_src),
        .alu_op(alu_op),
        .data_out_source_reg1(data_out_source_reg1),
        .data_out_source_reg2(data_out_source_reg2),
        .alu_out(alu_out)
    );

    // Choose what to output (here we show ALU result)
    assign uo_out = alu_out;

    // Unused bidirectional pins
    assign uio = 8'bz;
    assign uio_oe = 8'b0;

endmodule

