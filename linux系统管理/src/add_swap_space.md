# 增加 swap 空间

```
dd if=/dev/zero of=/path/to/swapfile bs=1M count=32  # 32M
sync
mkswap /path/to/swapfile
sync
chmod 0600 /swap
swapon /path/to/swapfile
```
