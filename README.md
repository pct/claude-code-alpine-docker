# Tifa

最簡單的 Claude Code Docker 隔離

## 使用

```bash
make run      # 建構並執行
make install  # 安裝全域 tifa 指令
```

## 指令

| 指令 | 說明 |
|------|------|
| `make build` | 建構 Docker image |
| `make run` | 建構並執行容器 |
| `make install` | 安裝全域 `tifa` 指令 |
| `make uninstall` | 移除全域指令 |
| `make clean` | 移除 Docker image |

## 原理

Dockerfile + Makefile = 完整隔離

## 為什麼？

- Docker 隔離 = 安全
- Dangerous mode = 快速
- 當前目錄掛載 = 實用
- 自動更新 = 持久化 volume

就這樣。
