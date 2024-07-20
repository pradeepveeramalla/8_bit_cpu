`timescale 1ns / 1ps

module and_gate_tb;
    // Testbench signals
    reg a;
    reg b;
    wire y;

    // Instantiate of gate
    and_gate uut (
        .a(a), 
        .b(b), 
        .y(y)
    );

    initial begin

        $dumpfile("and_gate_tb.vcd");
        $dumpvars(0,and_gate_tb);
        // Initialize inputs
        a = 0;
        b = 0;

        #10 a = 0; b = 0; // Expected output y = 0
        #10 a = 0; b = 1; // Expected output y = 0
        #10 a = 1; b = 0; // Expected output y = 0
        #10 a = 1; b = 1; // Expected output y = 1

        // Finish simulation
        #10 $finish;
    end

    initial begin
        // Monitor the signals
        $monitor("Time = %0d, a = %b, b = %b, y = %b", $time, a, b, y);
    end
endmodule
