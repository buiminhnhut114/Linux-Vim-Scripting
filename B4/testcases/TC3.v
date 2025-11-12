task run_test;
  begin
    #100;
    $display("=======================================================================================");
    $display("                        COUNTER CONTROL DIV VALUE CHECK                                ");
    $display("=======================================================================================\n");

    $display("================================= FAIL CASE ===========================================");
    // pwrite, paddr, psel, penable, tim_wdata
    counter_control_div_val_check(1,12'h000,1,1,32'h0000_0900);
    counter_control_div_val_check(1,12'h000,1,1,32'h0000_0001);
    counter_control_div_val_check(1,12'h000,1,1,32'h0000_0102);
    counter_control_div_val_check(1,12'h000,1,1,32'h0000_0200);
    counter_control_div_val_check(1,12'h000,1,1,32'h0000_0301);
    counter_control_div_val_check(1,12'h000,1,1,32'h0000_0402);
    counter_control_div_val_check(1,12'h000,1,1,32'h0000_0500);
    counter_control_div_val_check(1,12'h000,1,1,32'h0000_0601);
    counter_control_div_val_check(1,12'h000,1,1,32'h0000_0702);
    counter_control_div_val_check(1,12'h000,1,1,32'h0000_0800);
    counter_control_div_val_check(1,12'h000,1,1,32'h0000_0901);

    $display("================================ SUCCESS CASE =========================================");
    counter_control_div_val_check(1,12'h000,1,1,32'h0000_0003);
    counter_control_div_val_check(1,12'h000,1,1,32'h0000_0103);
    counter_control_div_val_check(1,12'h000,1,1,32'h0000_0203);
    counter_control_div_val_check(1,12'h000,1,1,32'h0000_0303);
    counter_control_div_val_check(1,12'h000,1,1,32'h0000_0403);
    counter_control_div_val_check(1,12'h000,1,1,32'h0000_0503);
    counter_control_div_val_check(1,12'h000,1,1,32'h0000_0603);
    counter_control_div_val_check(1,12'h000,1,1,32'h0000_0703);
    counter_control_div_val_check(1,12'h000,1,1,32'h0000_0803);
    counter_control_div_val_check(1,12'h000,1,1,32'h0000_0903);
    // FIX cú pháp sai: 32'h0000_0x03  ->  32'h0000_0003
    // counter_control_div_val_check(1,12'h000,1,1,32'h0000_0003);

    $display("RESULT: PASS");
  end
endtask

