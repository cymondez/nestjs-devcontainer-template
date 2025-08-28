# NestJS DevContainer 樣板

本專案提供一個可重複使用的 NestJS DevContainer 樣板，內建常用開發服務：

- 預設支援 database、redis
- 可選用 Traefik 反向代理（需搭配 druidfi/stonehenge 環境）
- 預先安裝了VSCode NestJS相關的擴充
- 預先裝載並設定MySQL的連線擴充工具

---

## Traefik 與 Stonehenge 依賴

- `docker-compose.override.yml` 內的 Traefik 設定，需依賴 [druidfi/stonehenge](https://github.com/druidfi/stonehenge) 所建立的 `stonehenge-network`。
- 請先確認本機已安裝 stonehenge，且 `stonehenge-network` 已存在。
- 若未安裝 stonehenge 或不需 Traefik 整合，請勿載入 `docker-compose.override.yml`，否則 devcontainer 啟動會失敗。

### 如何切換 Traefik 支援

- **啟用 Traefik（預設）**：

  ```jsonc
  "dockerComposeFile": [
      "docker-compose.yml",
      "docker-compose.override.yml"
  ],
  ```

- **停用 Traefik**：
  只保留 `docker-compose.yml`，將 `docker-compose.override.yml` 那行註解或移除。

---

## 啟動前建議

- 建議先執行下列指令檢查 network 是否存在：

    ```sh
    docker network ls --format "{{.Name}}" | grep -q "^stonehenge-network$" 2>nul || docker network ls --format "{{.Name}}" | findstr /C:"stonehenge-network" >nul
    ```

- 若未偵測到 `stonehenge-network`，請先安裝 stonehenge 或切換為不載入 override。

---

## 其他說明

- 首次啟動 container 後，請依終端機提示建立 NestJS 專案。

  ```sh
  nest new [Project Name] --directory .
  ```

- 如需自訂服務，請修改 `docker-compose.yml` 或新增對應的 override 檔案。
