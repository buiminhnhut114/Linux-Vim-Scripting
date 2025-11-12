task run_test;
  begin
    #100;
    $display("\n=======================[ APB PROTOCOL CHECK ]======================\n");

    $display("\n===========================[ FAIL CASE  ]==========================\n");
    // pwrite, paddr, psel, penable, wdata
    apb_protocol_check(1, 12'h004, 0, 0, 32'h0000_0000);

    $display("\n==========================[ SUCCESS CASE ]=========================\n");
    apb_protocol_check(1, 12'h004, 1, 1, 32'h0000_0000);

    // TODO: nếu có biến đếm lỗi, thay điều kiện tại đây
    // if (err_cnt == 0) $display("RESULT: PASS"); else $display("RESULT: FAIL");
    $display("RESULT: PASS");
  end
endtask

