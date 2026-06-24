module traffic_light_controller #(
        parameter RED_TIME = 5,
        parameter GREEN_TIME = 4,
        parameter YELLOW_TIME = 2
    )(
        input clk, 
        input rst,
        output reg red, 
        output reg green,
        output reg yellow
    );

    localparam RED_STATE    = 2'b00;
    localparam GREEN_STATE  = 2'b01;
    localparam YELLOW_STATE = 2'b10;
    
    localparam MAX_TIME = (RED_TIME>=GREEN_TIME) ? ((RED_TIME>=YELLOW_TIME) ? RED_TIME : YELLOW_TIME) : ((GREEN_TIME>=YELLOW_TIME) ? GREEN_TIME : YELLOW_TIME);

    localparam CNT_WIDTH = (MAX_TIME <= 1) ? 1 : $clog2(MAX_TIME);

    reg [CNT_WIDTH-1 : 0] count;
    reg [1:0] state;

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            count <= {CNT_WIDTH{1'b0}};
            state <= RED_STATE;
        end
        else begin
            case (state)
                RED_STATE: begin
                    if (count == RED_TIME-1) begin
                        count <= {CNT_WIDTH{1'b0}};
                        state <= GREEN_STATE;
                    end
                    else begin
                        count <= count + 1;
                    end
                end 
                GREEN_STATE: begin
                    if (count == GREEN_TIME-1) begin
                        count <= {CNT_WIDTH{1'b0}};
                        state <= YELLOW_STATE;
                    end
                    else begin
                        count <= count + 1;
                    end
                end 
                YELLOW_STATE: begin
                    if (count == YELLOW_TIME-1) begin
                        count <= {CNT_WIDTH{1'b0}};
                        state <= RED_STATE;
                    end
                    else begin
                        count <= count + 1;
                    end
                end 
                default: begin
                    state <= RED_STATE;
                    count <= {CNT_WIDTH{1'b0}};
                end
            endcase
        end
    end

        always @(*) begin
            red = 1'b0;
            green = 1'b0;
            yellow = 1'b0;

            case (state)
                RED_STATE: red = 1'b1; 
                GREEN_STATE: green = 1'b1; 
                YELLOW_STATE: yellow = 1'b1; 
                default: red = 1'b1;
            endcase
        end
endmodule