program coin_a.aleo;

  record coin_a:
    owner as address.private;
    gates as u64.private;
    amount as u64.private;
    custom1 as u64.private;

function mint:
    input r0 as address.private;
    input r1 as u64.private;
    cast r0 0u64 r1 1234u64 into r2 as coin_a.record;
    output r2 as coin_a.record;

function transfer:
    input r0 as coin_a.record;
    input r1 as address.private;
    input r2 as u64.private;
    sub r0.amount r2 into r3;
    cast r1 0u64 r2 1234u64 into r4 as coin_a.record;
    cast r0.owner r0.gates r3 1234u64 into r5 as coin_a.record;
    output r4 as coin_a.record;
    output r5 as coin_a.record;
