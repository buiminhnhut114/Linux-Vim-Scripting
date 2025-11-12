#!/usr/bin/env bash
#make TESTNAME=TC1 all
#make TESTNAME=TC2 all
#make TESTNAME=TC3 all
#make TESTNAME=TC4 all

# ----- định vị thư mục -----
SCRIPT_DIR="$(cd -- "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"         # .../B4
TCDIR="$ROOT/testcases"
LOGDIR="$ROOT/log"
WORKDIR="$ROOT/work"
RUNNER="$SCRIPT_DIR/run_one.sh"

mkdir -p "$LOGDIR" "$WORKDIR"

REPORT="$ROOT/testlist.rpt"
: > "$REPORT"

if ! compgen -G "$TCDIR/TC*.v" >/dev/null; then
  echo "Không tìm thấy test nào trong $TCDIR (dạng TC*.v)" >&2
  exit 2
fi

mapfile -t TCS < <(cd "$TCDIR" && ls -1 TC*.v | sed 's/\.v$//' | sort)

# ----- kiểm tra runner -----
if [[ ! -x "$RUNNER" ]]; then
  echo "Lỗi: thiếu runner $RUNNER (tạo ở sim/run_one.sh)"; exit 3
fi

# ----- chạy -----
for tc in "${TCS[@]}"; do
  log="$LOGDIR/$tc.log"
  echo "==> Running $tc (log: $log)"
  set +e
  "$RUNNER" "$tc" >"$log" 2>&1
  rc=$?
  set -e

  verdict="NA"
  if grep -q 'RESULT:[[:space:]]*PASS' "$log"; then
    verdict="PASS"
  elif grep -q 'RESULT:[[:space:]]*FAIL' "$log"; then
    verdict="FAIL"
  else
    # Không thấy RESULT trong log -> NA (compile/sim lỗi hoặc test không in kết quả)
    :
  fi

  printf "%s: %s\n" "$tc" "$verdict" | tee -a "$REPORT" >/dev/null
done

echo "Report directory : $LOGDIR" >> "$REPORT"
echo "Done. Xem report: $REPORT"

