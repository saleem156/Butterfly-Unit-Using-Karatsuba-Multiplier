
module KM(
    input logic clk,
    input logic rst_n,
    input logic [11:0]a,
    input logic [11:0]b,
    output logic [11:0]h, //Higher bits
    output logic [11:0]l); //Lower bits

logic [5:0] A0, A1, B0, B1;

assign A0 = a[11:0];
assign A1 = a[11:6];

assign B0 = b[5:0];
assign B1 = b[11:6];

logic [11:0] Z0_w, Z2_w;
logic [13:0] Z1_w; 
logic [12:0]CROSS_w;

assign Z0_w    = A0 * B0;
assign Z2_w    = A1 * B1;
assign Z1_w    = (A0 + A1) * (B0 + B1);
assign CROSS_w = Z1_w - Z2_w - Z0_w;

logic [11:0] Z0_r, Z2_r;
logic [13:0] CROSS_r;

logic valid1;

always_ff @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        Z0_r    <= 0;
        Z2_r    <= 0;
        CROSS_r <= 0;
        valid1  <= 0;
    end
    else
    begin
        Z0_r    <= Z0_w;
        Z2_r    <= Z2_w;
        CROSS_r <= CROSS_w;
        valid1  <= 1'b1;
    end
end

logic [23:0] PRODUCT;

assign PRODUCT = (Z2_r << 12) +
                 (CROSS_r << 6) +
                  Z0_r;

always_ff @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        h <= 0;
        l  <= 0;
    end
    else if(valid1)
    begin
        h <= PRODUCT[23:12];
        l  <= PRODUCT[11:0];
    end
end
    
endmodule
