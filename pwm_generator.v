`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.05.2024 19:24:57
// Design Name: 
// Module Name: pwm_generator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module button_sync_pwm_generator (
    input wire clock,
    input wire reset,
    input wire increment,
    input wire decrement,
    output reg pwm_out
);

    reg [31:0] COUNT;
    reg [15:0] PERIOD = 16'd100; // 1 MHz frequency (assuming a 100 MHz clock)
    reg [15:0] ACTIVE = 16'd50;  // 50% duty cycle initially
    
    wire pb_out;
    
    // Instantiate the button synchronizer
    button_synchronizer button_sync_inst (
        .pb_1(increment),
        .clk(clock),
        .pb_out(pb_out)
    );

    // Counter logic
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            COUNT <= 16'd0;
            pwm_out <= 1'b0;
        end else begin
            if (COUNT >= PERIOD) begin
                COUNT <= 16'd0;
            end else begin
                COUNT <= COUNT + 1;
            end
            
            if (ACTIVE >= PERIOD) begin
                pwm_out <= 1'b1;  // 100% duty cycle
            end else if (COUNT < ACTIVE) begin
                pwm_out <= 1'b1;
            end else begin
                pwm_out <= 1'b0;
            end
        end
    end

    // Duty cycle adjustment
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            ACTIVE <= 16'd50;
        end else if (increment && !decrement) begin
            if (ACTIVE + (PERIOD / 10) <= PERIOD)
                ACTIVE <= ACTIVE + (PERIOD / 10);
            else
                ACTIVE <= PERIOD;
        end else if (decrement && !increment) begin
            if (ACTIVE >= (PERIOD / 10))
                ACTIVE <= ACTIVE - (PERIOD / 10);
            else
                ACTIVE <= 16'd0;
        end
    end
endmodule

// Button synchronizer module
module button_synchronizer(
    input pb_1,
    input clk,
    output reg pb_out
);
    wire slow_clk;
    wire Q1, Q2, Q2_bar, Q0;
    
    // Clock divider for debouncing
    clock_div u1(clk, slow_clk);
    
    // D flip-flops for debouncing
    my_dff d0(slow_clk, pb_1, Q0);
    my_dff d1(slow_clk, Q0, Q1);
    my_dff d2(slow_clk, Q1, Q2);
    
    // Output generation
    assign Q2_bar = ~Q2;
    assign pb_out = Q1 & Q2_bar;
endmodule

// Clock divider module
module clock_div(
    input Clk_100M,
    output reg slow_clk
);
    reg [26:0] counter = 0;
    
    always @(posedge Clk_100M) begin
        counter <= (counter >= 249999) ? 0 : counter + 1;
        slow_clk <= (counter < 125000) ? 1'b0 : 1'b1;
    end
endmodule

// D flip-flop module
module my_dff(
    input DFF_CLOCK,
    input D,
    output reg Q
);
    always @(posedge DFF_CLOCK) begin
        Q <= D;
    end
endmodule
