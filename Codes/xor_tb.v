
`timescale 1ns/1ps

module tb_xor_64_bit;

    reg [63:0] a, b;
    wire [63:0] R;

    xor_64_bits xor_test(a,b,R);

    initial 
    begin
        $dumpfile("Xor_dump.vcd");
        $dumpvars(0,tb_xor_64_bit); 
    end


    initial begin
        $display("Testing 64-bit XOR circuit\n\n");

        // Test Case 1: Both positive 
        a = 1034024;
        b = 1232345;

        #10; 
        $display("a = %b", a);
        $display("b = %b", b);
        $display("R = %b\n", R);



        // Test Case 2:  Negative and Negative 
        a = -978234414;
        b = -903877238;
        #10; 
        $display("a = %b", a);
        $display("b = %b", b);
        $display("R = %b\n", R);



        // Test Case 3:  Positive and Negative 
        a = 64'b1100000000000000000000000000000000000000000000000000010101010110; 
        b = 64'b0100000000000000000000000000000000000000000000000000001100001001; 
        #10;       
        $display("a = %b", a);
        $display("b = %b", b);
        $display("R = %b\n", R);


        // Test Case 4:  Negative and Positive 
        a = -844927;
        b = 26723112;
        #10;       
        $display("a = %b", a);
        $display("b = %b", b);
        $display("R = %b\n", R);


        $finish; 
    end

endmodule
