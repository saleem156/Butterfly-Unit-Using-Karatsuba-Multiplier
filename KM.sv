module KM (
    input  logic        clk,
    input  logic        rst_n,
    input  logic [11:0] A,
    input  logic [11:0] B,

    output logic [23:0] PRODUCT
);

    logic [5:0]  A0, A1;
    logic [5:0]  B0, B1;

    logic [11:0] Z0;
    logic [11:0] Z2;

    logic [6:0]  SUM_A;
    logic [6:0]  SUM_B;

    logic [13:0] Z1;
    logic [13:0] CROSS;

    always_ff @(posedge clk or negedge rst_n) begin

        if (!rst_n) begin

            PRODUCT <= 24'd0;

        end

        else begin

            A0 = A[5:0];
            A1 = A[11:6];

            B0 = B[5:0];
            B1 = B[11:6];

            Z0 = A0 * B0;

            Z2 = A1 * B1;

            SUM_A = A0 + A1;
            SUM_B = B0 + B1;

            Z1 = SUM_A * SUM_B;

            CROSS = Z1 - Z2 - Z0;

          PRODUCT = (Z2 << 12) + (CROSS << 6) + Z0;

        end

    end

endmodule
