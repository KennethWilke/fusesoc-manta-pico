module top(
  input clk,
  input sw2,
  input rx,
  output tx,
  output r_n,
  output g_n,
  output b_n
);

  logic r, g, b;
  assign r_n = !r,
    g_n = !g,
    b_n = !b;

manta manta_inst(
  .clk(clk),
  .rst(0),
  .rx(rx),
  .tx(tx),
  .sw2(sw2),
  .r(r),
  .g(g),
  .b(b)
);


endmodule
