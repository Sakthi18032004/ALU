`timescale 1ns/1ps

module tb_ALU;

    reg [63:0] a, b;
    reg [1:0] control;
    wire [63:0] result;
    wire carry,of;


    ALU model(a,b,control,result,carry,of);

    initial 
    begin
        $dumpfile("ALU_dump.vcd");
        $dumpvars(0,tb_ALU); 
    end


    initial begin
        $display("Testing ALU");

        // Test Case 1: Addition -> results in overflow 
        a = 64'd9223372036854775807;
        b = -64'd9223372036854775808;
        control = 2'b01; 
        #10;
        $display("control=%b",control); 
        $display("a = %b", a);
        $display("b = %b", b);
        $display("sum = %b", result);
        $display("carry = %b", carry);
        $display("overflow= %b\n", of);


        // Test Case 2: Subtraction
        a = 4;
        b = -2;  
        control = 2'b01;  
        #10;
        $display("control=%b",control); 
        $display("a = %b", a);
        $display("b = %b", b);
        $display("Diff = %b", result);
        $display("Borrow = %b", carry);
        $display("overflow= %b\n", of);

        // Test Case 3 : And Block 
        a = 5938913;
        b = 4228049;
        control = 2'b10; 
        #10;
        $display("control=%b",control); 
        $display("a = %b", a);
        $display("b = %b", b);
        $display("y = %b\n", result);


        // Test Case 4 : XOR block 
        a = 4849129;  
        b = 1147280;  
        control = 2'b11; 
        #10;
        $display("control=%b",control); 
        $display("a = %b", a);
        $display("b = %b", b);
        $display("y = %b\n", result);

        // Test Case 5: Addition
        a = 293031;
        b = 12;
        control = 2'b00; 
        #10;
        $display("control=%b",control); 
        $display("a = %b", a);
        $display("b = %b", b);
        $display("sum = %b", result);
        $display("carry = %b", carry);
        $display("overflow= %b\n", of);


        $finish;
    end


endmodule
