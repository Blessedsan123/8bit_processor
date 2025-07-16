`timescale 1ns / 1ps

module tb;

  // Testbench signals
  reg clk;
  reg rst_n;
  reg [7:0] ui_in;
  wire [7:0] uo_out;
  wire [7:0] uio;
  wire [7:0] uio_oe;

  // Instantiate the top-level wrapper
  tt_um_myprocessor dut (
    .clk(clk),
    .rst_n(rst_n),
    .ui_in(ui_in),
    .uo_out(uo_out),
    .uio(uio),
    .uio_oe(uio_oe)
  );

  // Clock generation: 10ns period (100 MHz)
  always #5 clk = ~clk;

  // Test sequence
  initial begin
    // Monitor key signals
    $monitor("Time = %0t | clk = %b | rst_n = %b | ui_in = %h | uo_out = %h", 
              $time, clk, rst_n, ui_in, uo_out);

    // Initialize
    clk = 0;
    rst_n = 0;
    ui_in = 8'b0;

    // Apply reset
    #20 rst_n = 1;

    // Run simulation for some time
    #500;

    // End simulation
    $finish;
  end

endmodule
