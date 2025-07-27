`timescale 1ns/1ps

module tb_and_64_bit;

    reg [63:0] a, b;
    wire [63:0] R;

    and_64_bits and_test(a,b,R);

    initial 
    begin
        $dumpfile("and_dump.vcd");
        $dumpvars(0,tb_and_64_bit); 
    end


    initial begin
        $display("Testing 64-bit AND circuit\n\n");

        // Test Case 1: Both positive 
        a = 103432024;
        b = 123234235;

        #10; 
        $display("a = %b", a);
        $display("b = %b", b);
        $display("R = %b\n", R);



        // Test Case 2:  Negative and Negative 
        a = -78234414;
        b = -33877238;
        #10; 
        $display("a = %b", a);
        $display("b = %b", b);
        $display("R = %b\n", R);



        // Test Case 3:  Positive and Negative 
        a = 64'b1100011100000000000000000000000000000000000000000000010101010110; 
        b = 64'b0100010100000000000000000000000000000000000000000000001100001001; 
        #10;       
        $display("a = %b", a);
        $display("b = %b", b);
        $display("R = %b\n", R);


        // Test Case 4:  Negative and Positive 
        a = -84433927;
        b = 7232112;
        #10;       
        $display("a = %b", a);
        $display("b = %b", b);
        $display("R = %b\n", R);


        $finish; 
    end

endmodule
