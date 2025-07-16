`timescale 1ns / 1ps

module tb;

    initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);
    #1;
  end

  // Testbench signals
  reg clk;
  reg rst_n;
  reg ena;
  wire [7:0] uo_out;

  // Instantiate the top-level wrapper
  tt_um_myprocessor dut (
    .clk(clk),
    .rst_n(rst_n),
    .ena(ena),
    .uo_out(uo_out)
  );

  // Clock generation: 10ns period (100 MHz)
  always #5 clk = ~clk;

  // Test sequence
  initial begin
    // Monitor key signals
    $monitor("Time = %0t | clk = %b | rst_n = %b | uo_out = %h", 
              $time, clk, rst_n, uo_out);

    // Initialize
    clk = 0;
    rst_n = 0;

    // Apply reset
    #20 rst_n = 1;

  end

endmodule
