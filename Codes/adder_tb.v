
`timescale 1ns/1ps

module tb_add_64_bit;

    reg [63:0] a, b;
    wire [63:0] S;
    wire C;

    add_64_bit add_test(a,b,S,C);

    initial 
    begin
        $dumpfile("Adder_dump.vcd");
        $dumpvars(0,tb_add_64_bit); 
    end


    initial begin
        $display("Testing 64-bit Adder\n\n");

        // Test Case 1: Both positive ( no carry )
        a = 1293456;
        b = 10290;

        #10; 
        $display("a = %b", a);
        $display("b = %b", b);i

        // Test Case 2:  Both positive ( carry )
        a = 64'b0111111111111111111111111111111111111111111111111111111111111111;
        b = 64'b1110000000000000000000000000000000000000000000000000000000000010;

        #10; 
        $display("a = %b", a);
        $display("b = %b", b);
        $display("S = %b", S);
        $display("C = %b\n", C);

        // Test Case 3:  Positive and negative (No carry possible)
        a = 3;
        b = -1;
        #10; 
        $display("a = %b", a);
        $display("b = %b", b);
        $display("S = %b", S);
        $display("C = %b\n", C);

        // Test Case 4:  Negative and negative (Always carry )
        a = -1;
        b = -2;
        #10; 
        $display("a = %b", a);
        $display("b = %b", b);
        $display("S = %b", S);
        $display("C = %b", C);



        $finish; 
    end

endmodule
