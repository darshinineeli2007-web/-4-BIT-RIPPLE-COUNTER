// 4-bit Ripple Counter (Asynchronous Up Counter)
module bitripplecounter (
    input clk,        // Clock input
    input reset,      // Asynchronous reset
    output [3:0] q    // 4-bit output
);
    // Internal flip-flop connections
    T_flipflop t0 (.clk(clk),     .reset(reset), .q(q[0]));
    T_flipflop t1 (.clk(q[0]),    .reset(reset), .q(q[1]));
    T_flipflop t2 (.clk(q[1]),    .reset(reset), .q(q[2]));
    T_flipflop t3 (.clk(q[2]),    .reset(reset), .q(q[3]));
endmodule

// T Flip-Flop module
module T_flipflop (
    input clk,
    input reset,
    output reg q
);
    always @(negedge clk or posedge reset) begin
        if (reset)
            q <= 1'b0;
        else
            q <= ~q;  // Toggle output on each clock pulse
    end
endmodule
