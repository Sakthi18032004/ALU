`timescale 1ns/10ps

module dataMem(clk, Add, wEn, M_valA, rEn, m_valM, dmem_err);

    input clk, wEn, rEn;
    input [63:0] Add;
    input [63:0] M_valA;

    output reg [63:0] m_valM;
    output reg dmem_err;

    initial begin
        dmem_err = 0;
    end

    reg [63:0] memory [0:1023];

    always @(*) begin
        if (!(wEn & rEn) && ((0 <= Add) && (Add < 1024)) ) begin
            if (wEn & !rEn) begin
                memory[Add] = M_valA;
                dmem_err = 0;
            end

            if (rEn & !wEn) begin
                m_valM = memory[Add];
                dmem_err = 0;
            end

            if (!rEn & !wEn) begin
                dmem_err = 1;
                m_valM = 8'hx;
            end

        end   

        else
        begin
          dmem_err = 1;
          m_valM = 8'hx; // settting the value to unknown ( cause data is not read )
        end  
    
    end

endmodule

