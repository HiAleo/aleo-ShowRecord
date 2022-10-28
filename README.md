# showrecord.aleo

## Record asset report program
In the asset management of the Aleo Program, the owner is only allowed to view the assets. Therefore, the owner has difficulty in issuing a report on his own assets to others. This program is designed to show a designated person the custom details of his own assets. Issue a report to the others (if the asset has been consumed, the report cannot be issued)

function record_a (coin_a, other) is to show others their own coin_a's asset report

For external record, you can directly assign a report without rebuilding the restored asset, because external record reading references will not be consumed, but the negative problem is that you cannot prove to the other party whether the asset has been consumed, only that the asset once belonged to the caller. However, this feature can also be used to design reasonable applications in some occasions: for example, to distribute (air drop) to users who once owned an asset.

### Note
At present, the snarkVM version does not support defining multiple records in a program, so the above programs need to be adjusted if they are to be tested. Otherwise, the deployment will print "Only one record type is allowed in the program"


## Record资产报告小程序Program
Aleo Program 的资产管理，资产只对Owner开放查看权限，所以Owner想要对他人出具自己拥有某资产的报告存在困难，这个小程序就是为了向某个指定>的人展示自己拥有资产的方案。向对方出具报告（如果该资产已经消耗掉了，那么就无法出具报告了）

function record_a(coin_a, other) 就是向other展示自己的 coin_a 的资产报告

如果针对外部资产record（ External Record )，则可以直接赋值出报告，而无需重新构建还原资产，因为 External Record 读取引用是不会被消耗的>，但是带来的负面问题就是，无法向对方证明该资产是否已经被消耗掉，只能证明资产曾经属于调用者。但是利用这种特性，在某些场合也能设计合理的
应用：比如向曾经拥有某资产的用户做派发（空投）。

### 注意：
目前snarkVM的版本还不支持在一个program中定义多种record,所以上面的程序如果要测试都需要进行调整。否则部署会打印『Only one record type is allowed in the program』

## Build Guide
The following Aleo Program Demo is Deployed and Tested by https://github.com/aleohq/aleo  

```bash
aleo build
```

### Mint test token, amount = 100
```bash
aleo run mint_a aleo1gy9h3a9sywc7p23acd5jjt9suuh663q0fv8uegpgr36je20xf5rsggnarq 100u64
```

### Show the record to anther account "aleo1s5rr2mkm9ys3tk7ch7mxsa3f5az3vuvgr0h8zrhj3hpzfcqt9vqsulemeq"
```bash
aleo run report_a "{ owner: aleo1gy9h3a9sywc7p23acd5jjt9suuh663q0fv8uegpgr36je20xf5rsggnarq.private, gates: 0u64.private, amount: 100u64.private, custom1: 1234u64.private, _nonce: 0group.public }" aleo1s5rr2mkm9ys3tk7ch7mxsa3f5az3vuvgr0h8zrhj3hpzfcqt9vqsulemeq
```
