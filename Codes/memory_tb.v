
`timescale 1ns/1ps

module testbench;

    reg [63:0] Add;
    reg [63:0] M_valA;  // value to be written 
    reg clk;
    reg wEn, rEn;
    reg test;

    wire [63:0] m_valM;  // value to be read 
    wire dmem_err;

    initial
    begin
        $dumpfile("Memory_dump.vcd");
        $dumpvars(0, testbench);
        
        clk = 1'b0;
    end

    initial begin
        repeat (10) begin
        clk = 0;
        #5;
        clk = ~clk;
        #5;
        end
    end

    dataMem M1 (clk, Add, wEn, M_valA, rEn, m_valM, dmem_err);

    initial begin

       

        wEn = 1'b1;
        rEn = 1'b0;
        Add = 64'd101;
        M_valA = 64'd3025;
        #10

        if(dmem_err==1) begin
            $display("Memory Error detected");
        end

        $display("Write = %b", wEn);
        $display("Read = %b", rEn);
        $display("Address = %3d" , Add);
        $display("Input = %3d", M_valA);
        $display("Output (Memory value) = %3d\n\n" , m_valM);

        
        wEn = 1'b0;
        rEn = 1'b0;
        Add = 64'd201;
        M_valA = 64'd6045;
        #10



        if(dmem_err==1) begin
            $display("Memory Error detected");
        end

        $display("Write = %b", wEn);
        $display("Read = %b", rEn);
        $display("Address = %3d" , Add);
        $display("Input = %3d", M_valA);
        $display("Output (Memory value) = %3d\n\n" , m_valM);


    
        wEn = 1'b0;
        rEn = 1'b1;
        Add = 64'd101;
        M_valA = 64'd4025;
        #10



        if(dmem_err==1) begin

            $display("Memory Error detected");

        end
        $display("Write = %b", wEn);
        $display("Read = %b", rEn);
        $display("Address = %3d" , Add);
        $display("Input = %3d", M_valA);
        $display("Output (Memory value) = %3d\n\n" , m_valM);
        

        wEn = 1'b0;
        rEn = 1'b1;
        Add = 64'd201;
        M_valA = 64'd6045;
        #10


        if(dmem_err==1) begin
            $display("Memory Error detected");

        end

        $display("Write = %b", wEn);
        $display("Read = %b", rEn);
        $display("Address = %3d" , Add);
        $display("Input = %3d", M_valA);
        $display("Output (Memory value) = %3d\n\n" , m_valM);

        wEn = 1'b1;
        rEn = 1'b0;
        Add = 64'd401;
        M_valA = 64'd4576;
        #10

        if(dmem_err==1) begin
            $display("Memory Error detected");
        end

        $display("Write = %b", wEn);
        $display("Read = %b", rEn);
        $display("Address = %3d" , Add);
        $display("Input = %3d", M_valA);
        $display("Output (Memory value) = %3d\n\n" , m_valM);

        wEn = 1'b0;
        rEn = 1'b1;
        Add = 64'd401;
        M_valA = 64'd6045;
        #10

        if(dmem_err==1) begin
            $display("Memory Error detected");

        end

        $display("Write = %b", wEn);
        $display("Read = %b", rEn);
        $display("Address = %3d" , Add);
        $display("Input = %3d", M_valA);
        $display("Output (Memory value) = %3d\n\n" , m_valM);


        wEn = 1'b1;
        rEn = 1'b1;
        Add = 64'd401;
        M_valA = 64'd6045;
        #10


        if(dmem_err==1) begin
            $display("Memory Error detected");
        end

        $display("Write = %b", wEn);
        $display("Read = %b", rEn);
        $display("Address = %3d" , Add);
        $display("Input = %3d", M_valA);
        $display("Output (Memory value) = %3d\n\n" , m_valM);


        // more than 1024 address location 

        wEn = 1'b0;
        rEn = 1'b1;
        Add = 64'd2905;
        M_valA = 64'd6045;
        test = $bits(Add);
        #10


        if(dmem_err==1) begin
            $display("Memory Error detected");

        end

        $display("Write = %b", wEn);
        $display("Read = %b", rEn);
        $display("Address = %3d" , Add);
        $display("Input = %3d", M_valA);
        $display("Output (Memory value) = %3d\n\n" , m_valM);


    end


endmodule