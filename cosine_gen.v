// Public Domain

module cosine_gen #(
    parameter bits = 8,
    parameter arr_len = 250
)(input clk,
  output reg [bits-1:0] val);

    reg [bits-1:0] arr [arr_len-1:0];
    reg [bits-1:0] ind = 0;
    localparam real arr_len_real = arr_len;
    localparam real max_bits = {(bits){1'b1}};
    localparam real pi =  3.1415926535897;
    integer i;


    initial begin
        $monitor("%d",maxbits);
        for (i=0; i < arr_len;  i=i+1) begin
            arr[i] <= $cos(2*pi*i/(arr_len_real+1))*(2.0**bits-1);
            //$display("%d",$cos(i/arr_len)*arr_len);
        end
    end

    always @(posedge clk) begin
        val <= arr[ind];
        ind <= ind + 1'b1;
    end
endmodule