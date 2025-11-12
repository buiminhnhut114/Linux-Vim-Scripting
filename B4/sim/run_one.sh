#!/usr/bin/env bash
# Chạy 1 test với Questa/ModelSim:
# - RTL list: sim/rtl.f
# - TB list : sim/tb.f (có module top tên TOP)
# - Testcase: testcases/TCx.v
# YÊU CẦU: testbench in "RESULT: PASS" / "RESULT: FAIL" ra transcript

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TCDIR="$ROOT/testcases"
WORKDIR="$ROOT/work"

TC="${1:?missing TC name}"           # ví dụ TC1
TC_SRC="$TCDIR/$TC.v"
RTL_F="$SCRIPT_DIR/rtl.f"
TB_F="$SCRIPT_DIR/tb.f"
TOP="top_tb"                         # đổi nếu top module tên khác

# Chuẩn bị thư viện work
mkdir -p "$WORKDIR"
vlib "$WORKDIR/work" 2>/dev/null || true
vmap work "$WORKDIR/work" >/dev/null

# Compile (đảm bảo đường dẫn trong rtl.f, tb.f là đúng)
vlog -work work -f "$RTL_F"
vlog -work work -f "$TB_F"
vlog -work work "$TC_SRC"

# Run batch
vsim -c work.$TOP -do "run -all; quit -f"
# Testbench nên $display(\"RESULT: PASS\") hoặc \"RESULT: FAIL\" trước khi $finish

