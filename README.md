# showrecord.aleo

## This Aleo Program Demo is Deployed and Tested by https://github.com/aleohq/aleo  

```bash
## 给自己创建coin_a测试币,amount=100
aleo run mint_a aleo1gy9h3a9sywc7p23acd5jjt9suuh663q0fv8uegpgr36je20xf5rsggnarq 100u64

## 给另一个账户aleo1s5rr2mkm9ys3tk7ch7mxsa3f5az3vuvgr0h8zrhj3hpzfcqt9vqsulemeq展示自己的测试币
aleo run report_a "{ owner: aleo1gy9h3a9sywc7p23acd5jjt9suuh663q0fv8uegpgr36je20xf5rsggnarq.private, gates: 0u64.private, amount: 100u64.private, custom1: 1234u64.private, _nonce: 0group.public }" aleo1s5rr2mkm9ys3tk7ch7mxsa3f5az3vuvgr0h8zrhj3hpzfcqt9vqsulemeq
```


## 中文版说明：

# Record资产报告小程序Program Demo
By Aaron(JiangHan)

Aleo Program 的资产管理，资产只对Owner开放查看权限，所以Owner想要对他人出具自己拥有某资产的报告存在困难，这个小程序就是为了向某个指定的人展示自己拥有资产的方案。向对方出具报告（如果该资产已经消耗掉了，那么就无法出具报告了）

function record_a(coin_a, other) 就是向other展示自己的 coin_a 的资产报告
function record_b(coin_b, other) 就是向other展示自己的 coin_b 的资产报告

==

In the asset management of the Aleo Program, the owner is only allowed to view the assets. Therefore, the owner has difficulty in issuing a report on his own assets to others. This program is designed to show a designated person the custom details of his own assets. Issue a report to the others (if the asset has been consumed, the report cannot be issued)

function record_a (coin_a, other) is to show others their own coin_a's asset report 
function record_a (coin_b, other) is to show others their own coin_b's asset report

==

    program showrecord.aleo;

    record coin_a:
        owner as address.private;
        gates as u64.private;
        amount as u64.private;
        custom1 as u64.private;
    
    record coin_a_report:
        owner as address.private;
        gates as u64.private;
        rep_owner as address.private;
        rep_gates as u64.private;
        rep_amount as u64.private;
        rep_custom1 as u64.private;
    
    record coin_b:
        owner as address.private;
        gates as u64.private;
        amount as u64.private;
        custom2 as u64.private;
    
    record coin_b_report:
        owner as address.private;
        gates as u64.private;
        rep_owner as address.private;
        rep_gates as u64.private;
        rep_amount as u64.private;
        rep_custom2 as u64.private;
    
    // 向r1出具自己拥有coin_a资产的报告，因为coin_a用完会消耗掉，所以需要给自己重新构建出来
    // Issue your own coin_a details to r1, because coin_a will be consumed when it is used up, so it needs to be rebuilt for yourself
    function report_a:
        input r0 as coin_a.record;
        input r1 as address.private;
        cast r1 0u64 r0.owner r0.gates r0.amount r0.custom1 into r2 as coin_a_report.record;
        cast r0.owner r0.gates r0.amount r0.custom1 into r3 as coin_a.record;
        output r2 as coin_a_report.record;
        output r3 as coin_a.record;
    
    // 向r1出具自己拥有coin_b资产的报告，因为coin_b用完会消耗掉，所以需要给自己重新构建出来
    // Issue your own coin_b details to r1, because coin_b will be consumed when it is used up, so it needs to be rebuilt for yourself
    function report_b:
        input r0 as coin_b.record;
        input r1 as address.private;
        cast r1 0u64 r0.owner r0.gates r0.amount r0.custom2 into r2 as coin_b_report.record;
        cast r0.owner r0.gates r0.amount r0.custom2 into r3 as coin_b.record;
        output r2 as coin_b_report.record;
        output r3 as coin_b.record;


如果针对外部资产record（ External Record )，则可以直接赋值出报告，而无需重新构建还原资产，因为 External Record 读取引用是不会被消耗的，但是带来的负面问题就是，无法向对方证明该资产是否已经被消耗掉，只能证明资产曾经属于调用者。但是利用这种特性，在某些场合也能设计合理的应用：比如向曾经拥有某资产的用户做派发（空投）。

==

For external record, you can directly assign a report without rebuilding the restored asset, because external record reading references will not be consumed, but the negative problem is that you cannot prove to the other party whether the asset has been consumed, only that the asset once belonged to the caller. However, this feature can also be used to design reasonable applications in some occasions: for example, to distribute (air drop) to users who once owned an asset.

==

附程序如下：


    import coin_a.aleo;
    import coin_b.aleo;
    
    program showrecord.aleo;
    
    record coin_a_report:
        owner as address.private;
        gates as u64.private;
        rep_owner as address.private;
        rep_gates as u64.private;
        rep_amount as u64.private;
        rep_custom1 as u64.private;
     
    record coin_b_report:
        owner as address.private;
        gates as u64.private;
        rep_owner as address.private;
        rep_gates as u64.private;
        rep_amount as u64.private;
        rep_custom2 as u64.private;
    
    // 向r1出具自己拥有coin_a资产的报告，coin_a由于是外部的，所以不会被消耗掉
    function report_a:
        input r0 as coin_a.aleo/coin_a.record;
        input r1 as address.private;
        cast r1 0u64 r0.owner r0.gates r0.amount r0.custom1 into r2 as coin_a_report.record;
        output r2 as coin_a_report.record;
    
    // 向r1出具自己拥有coin_b资产的报告，coin_b由于是外部的，所以不会被消耗掉
    function report_b:
        input r0 as coin_b.aleo/coin_b.record;
        input r1 as address.private;
        cast r1 0u64 r0.owner r0.gates r0.amount r0.custom2 into r2 as coin_b_report.record;
        output r2 as coin_b_report.record;
    

# 注意：
目前snarkVM的版本还不支持在一个program中定义多种record,所以上面的程序如果要测试都需要进行调整。否则部署会打印『Only one record type is allowed in the program』

At present, the snarkVM version does not support defining multiple records in a program, so the above programs need to be adjusted if they are to be tested. Otherwise, the deployment will print "Only one record type is allowed in the program"
