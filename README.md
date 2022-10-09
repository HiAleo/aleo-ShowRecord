# showrecord.aleo

## This Aleo Program Demo is Deployed and Tested by https://github.com/aleohq/aleo  

```bash
## 给自己创建coin_a测试币,amount=100
aleo run mint_a aleo1gy9h3a9sywc7p23acd5jjt9suuh663q0fv8uegpgr36je20xf5rsggnarq 100u64

## 给另一个账户aleo1s5rr2mkm9ys3tk7ch7mxsa3f5az3vuvgr0h8zrhj3hpzfcqt9vqsulemeq展示自己的测试币
aleo run report_a "{ owner: aleo1gy9h3a9sywc7p23acd5jjt9suuh663q0fv8uegpgr36je20xf5rsggnarq.private, gates: 0u64.private, amount: 100u64.private, custom1: 1234u64.private, _nonce: 0group.public }" aleo1s5rr2mkm9ys3tk7ch7mxsa3f5az3vuvgr0h8zrhj3hpzfcqt9vqsulemeq
```
