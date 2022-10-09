import coin_a.aleo;

program showrecord.aleo;

  record coin_a_report:
    owner as address.private;
    gates as u64.private;
    rep_owner as address.private;
    rep_gates as u64.private;
    rep_amount as u64.private;
    rep_custom1 as u64.private;
    
  // 向r1出具自己拥有coin_a资产的报告，coin_a由于是外部的，所以不会被消耗掉
  function report_a:
    input r0 as coin_a.aleo/coin_a.record;
    input r1 as address.private;
    cast r1 0u64 r0.owner r0.gates r0.amount r0.custom1 into r2 as coin_a_report.record;
    output r2 as coin_a_report.record;

  function mint_a:
    input r0 as address.private;
    input r1 as u64.private;
    call coin_a.aleo/mint r0 r1 into r2;
    output r2 as coin_a.aleo/coin_a.record;
