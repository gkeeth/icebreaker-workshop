`timescale 1ns/10ps
/* `include "stopwatch.v" */

module stopwatch_tb ();
    reg clk;

    // DUT inputs
    reg BTN_N, BTN1, BTN2, BTN3;

    // DUT outputs
    wire LED1, LED2, LED3, LED4, LED5;
    wire P1A1, P1A2, P1A3, P1A4, P1A7, P1A8, P1A9, P1A10;

    top dut(
        .CLK(clk),
        .BTN_N(BTN_N),
        .BTN1(BTN1),
        .BTN2(BTN2),
        .BTN3(BTN3),
        .LED1(LED1),
        .LED2(LED2),
        .LED3(LED3),
        .LED4(LED4),
        .LED5(LED5),
        .P1A1(P1A1),
        .P1A2(P1A2),
        .P1A3(P1A3),
        .P1A4(P1A4),
        .P1A7(P1A7),
        .P1A8(P1A8),
        .P1A9(P1A9),
        .P1A10(P1A10)
    );

    initial begin
        clk <= 1'b0;
        forever #20 clk <= ~clk;
    end

    initial begin
        BTN_N <= 0;
        BTN1 <= 0;
        BTN2 <= 0;
        BTN3 <= 0;
        #100
        BTN1 <= 1;
        #100
        BTN2 <= 1;
        #100
        BTN1 <= 0;
        #100
        BTN3 <= 1;
        #100
        BTN_N <= 1;
        #100
        BTN2 <= 0;
        #100
        BTN_N <= 0;
        #10000000
        BTN_N <= 1;
        #100
        BTN_N <= 0;
    end

    initial begin
        $dumpfile("stopwatch.vcd");
        $dumpvars(0, stopwatch_tb);
        #100000000
        $finish();
    end

endmodule
