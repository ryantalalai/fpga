`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// Ryan Joseph Talalai 
// CMPEN 417 SP24
// 11 March 2024
// 
//////////////////////////////////////////////////////////////////////////////////


module testbench(

    );
    
    
    reg clk,reset;
    
    reg output_valid=0;
    reg input_ready=0;
    
    
    wire input_valid;
    wire output_ready; 
    
    reg signed [15:0] ar,ai,br,bi;
    reg signed [31:0] result_r,result_i;
    
    
    wire [31:0]result_r_wire;
    wire [31:0]result_i_wire;
    
    //you are allowed to modifiy this
    complex_multiplier dut (
    .clk(clk),
    .reset(reset),
    .input_valid(output_valid),
    .output_ready(input_ready),
    .input_ready(output_ready),
    .output_valid(input_valid),
    .ar(ar),
    .ai(ai),
    .br(br),
    .bi(bi),
    .result_r(result_r_wire),
    .result_i(result_i_wire)
);


    
    always #5 clk=!clk;
    
    initial begin
    clk<=0;
    reset<=1;
    #10;
    
    reset<=0;
    
    
    #50
    
    if(output_ready)//if the complex multiplier is ready to receive the test inputs
    begin
        input_ready<=1;//if the complex_multiplier is ready, send some inputs
        output_valid<=1;
        ar<=15;
        ai<=51;
        br<=55;
        bi<=55;
    end
    
    
    #10 
    
   //clear the test data,and tell the complex multiplier 
   //there's no valid test inputs on the ports, the complex multiplier 
   //should not produce any valid results from this point
    output_valid=0;
    ar<=0;
    ai<=0;
    br<=0;
    bi<=0;
    
    
    #150
    
    if(result_r==-1980&result_i==3630)
    begin
    $display("ready valid test PASSED for 1st pair of inputs");
    end   
    else
    begin
    $display("ready valid test FAILED for 1st pair of inputs ");
    end
    #50
    if(output_ready)//if the complex multiplier is ready to receive the 2nd pair test inputs
    begin
        input_ready<=1;//if the complex_multiplier is ready, send 2nd pair inputs
        output_valid<=1;
        ar<=20;
        ai<=21;
        br<=15;
        bi<=15;
    end
    #10 
    
   //clear the test data,and tell the complex multiplier there's no valid test inputs on the ports, the complex multiplier should not produce any valid results from this point
    output_valid=0;
    ar<=0;
    ai<=0;
    br<=0;
    bi<=0;
    
    #150
    
    if(result_r==-15&result_i==615)
    begin
    $display("ready valid test PASSED for 2nd pair of inputs");
    end   
    else
    begin
    $display("ready valid test FAILED for 2nd pair of inputs failed");
    end
    
    
    
    end
        
    always@(posedge clk)
    begin
        
        if(input_valid)//if the complex multiplier is returning some valid result on the output port
        begin
            result_r<=result_r_wire;//if yes,the we collect the results and check if it is correct 
            result_i<=result_i_wire;//
        end
       
    
    end
    
endmodule
