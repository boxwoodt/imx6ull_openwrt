# 常见问题解答 (FAQ)

## 1、上电以后默认随机MAC地址，每次都要重新查找IP。

 `u-boot-2022` 中默认 mac 地址是随机生成，可以在 `u-boot` 中通过以下指令进行配置，保存在环境变量中。

```shell
setenv ethaddr 32:43:a0:63:17:7b
setenv eth1addr ae:62:ba:c5:6c:1c
saveenv
```
