`timescale 1ns/1ps

module tb_sub_64_bit;

    reg [63:0] a, b;
    wire [63:0] S;
    wire C;

    sub_64_bit sub_test(a,b,S,C);

    initial 
    begin
        $dumpfile("Subtractor_dump.vcd");
        $dumpvars(0,tb_sub_64_bit); 
    end


    initial begin
        $display("Testing 64-bit Subtractor\n\n");

        // Test Case 1: Both positive ( no carry ( a<b ) )
        a = 10024;
        b = 12345;

        #10; 
        $display("a = %b", a);
        $display("b = %b", b);
        $display("S = %b", S);
        $display("C = %b\n", C);

        // Test Case 2: Both positive ( carry  (a>b))
        a = 78120;
        b = 37821;

        #10; 
        $display("a = %b", a);
        $display("b = %b", b);
        $display("S = %b", S);
        $display("C = %b\n", C);


        // Test Case 3:  Negative and Negative ( No Carry -> result = negative)
        a = -9782314;
        b = -9038778;
        #10; 
        $display("a = %b", a);
        $display("b = %b", b);
        $display("S = %b", S);
        $display("C = %b\n", C);

        // Test Case 4:  Negative and Negative ( Carry -> result = positive )
        a = -34628478;
        b = -99028374;
        #10; 
        $display("a = %b", a);
        $display("b = %b", b);
        $display("S = %b", S);
        $display("C = %b\n", C);

       // Test Case 5:  Positive and Negative (No overflow  -> no carry  )
        a = 34628478;
        b = -99028374;
        #10; 
        $display("a = %b", a);
        $display("b = %b", b);
        $display("S = %b", S);
        $display("C = %b\n", C);

        // Test Case 6:  Positive and Negative ( Overflow -> carry )
        a = 64'b1100000000000000000000000000000000000000000000000000000000000000; 
        b = 64'b0100000000000000000000000000000000000000000000000000000000000000; 
        #10;       
        $display("a = %b", a);
        $display("b = %b", b);
        $display("S = %b", S);
        $display("C = %b\n", C);


        // Test Case 7:  Negative and Positive ( Carry -> result = negative )
        a = -8927;
        b = 267112;
        #10;       
        $display("a = %b", a);
        $display("b = %b", b);
        $display("S = %b", S);
        $display("C = %b\n", C);


        $finish; 
    end

endmodule
