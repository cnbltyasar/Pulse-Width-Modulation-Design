`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.05.2024 20:47:37
// Design Name: 
// Module Name: tb_pwm_generator
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


module tb_pwm_generator;
    reg clock;
    reg reset;
    reg increment;
    reg decrement;
    wire pwm_out;

    pwm_generator uut (
        .clock(clock),
        .reset(reset),
        .increment(increment),
        .decrement(decrement),
        .pwm_out(pwm_out)
    );

    initial begin
        // Initialize signals
   		// Dump waves
    	//$dumpfile("dump.vcd");
   		//$dumpvars(1);
        clock = 0;
        reset = 1;
        increment = 0;
        decrement = 0;

        // Reset the design
        #5 reset = 0;
        
        // Wait for some time
        #1000;

        // Test increment
        #5 increment = 1;
        #10 increment = 0;
        #1000;

        // Test decrement
        #5 decrement = 1;
        #10 decrement = 0;
        #1000;
		              // Test increment
        #5 increment = 1;
        #10 increment = 0;
        #1000;
              // Test increment
        #5 increment = 1;
        #10 increment = 0;
        #1000;
              // Test increment
        #5 increment = 1;
        #10 increment = 0;
        #1000;
              // Test increment
        #5 increment = 1;
        #1000 increment = 0;
        #1000;
              // Test increment
        #5 increment = 1;
        #10 increment = 0;
        #1000;
              // Test increment
        #5 increment = 1;
        #10 increment = 0;
        #1000;
		              // Test increment
        #5 increment = 1;
        #10 increment = 0;
        #1000;
		              // Test increment
        #5 increment = 1;
        #10 increment = 0;
        #1000;
		              // Test increment
        #5 increment = 1;
        #10 increment = 0;
        #1000;
		              // Test increment
        #5 increment = 1;
        #10 increment = 0;
        #1000;
		              // Test increment
        #5 increment = 1;
        #10 increment = 0;
        #1000;

              // Test decrement
        #5 decrement = 1;
        #10 decrement = 0;
        #1000;
              // Test decrement
        #5 decrement = 1;
        #10 decrement = 0;
        #1000;
              // Test decrement
        #5 decrement = 1;
        #10 decrement = 0;
        #1000;
		              // Test decrement
        #5 decrement = 1;
        #10 decrement = 0;
        #1000;

		
		              // Test decrement
        #5 decrement = 1;
        #10 decrement = 0;
        #1000;
		
		              // Test decrement
        #5 decrement = 1;
        #10 decrement = 0;
        #1000;
              // Test increment
        #5 increment = 1;
        #10 increment = 0;
        #1000;
              // Test increment
        #5 increment = 1;
        #10 increment = 0;
        #1000;
              // Test increment
        #5 increment = 1;
        #10 increment = 0;
        #1000;
              // Test increment
        #5 increment = 1;
        #10 increment = 0;
        #1000;
              // Test increment
        #5 increment = 1;
        #10 increment = 0;
        #1000;
              // Test increment
        #5 increment = 1;
        #10 increment = 0;
        #1000;
		              // Test increment
        #5 increment = 1;
        #10 increment = 0;
        #1000;
		              // Test increment
        #5 increment = 1;
        #10 increment = 0;
        #1000;
		              // Test increment
        #5 increment = 1;
        #10 increment = 0;
        #1000;
		              // Test increment
        #5 increment = 1;
        #10 increment = 0;
        #1000;
		              // Test increment
        #5 increment = 1;
        #10 increment = 0;
        #1000;
        // Finish the simulation
        #5000;
		              // Test decrement
        #5 decrement = 1;
        #10 decrement = 0;
        #1000;
		              // Test decrement
        #5 decrement = 1;
        #10 decrement = 0;
        #1000;
		              // Test decrement
        #5 decrement = 1;
        #10 decrement = 0;
        #1000;
		              // Test decrement
        #5 decrement = 1;
        #10 decrement = 0;
        #1000;
		              // Test decrement
        #5 decrement = 1;
        #10 decrement = 0;
        #1000;
		              // Test decrement
        #5 decrement = 1;
        #10 decrement = 0;
        #1000;
				              // Test decrement
        #5 decrement = 1;
        #10 decrement = 0;
        #1000;
				              // Test decrement
        #5 decrement = 1;
        #10 decrement = 0;
        #1000;
				              // Test decrement
        #5 decrement = 1;
        #10 decrement = 0;
        #1000;
        $finish;
    end

    // Clock generation
    always #5 clock = ~clock; // 100 MHz clock

endmodule

