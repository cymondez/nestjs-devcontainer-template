# 專案初始化指引
usage=$'
📦 專案初始化指引
請在終端機執行：
nest new [Project Name] --directory .
注意：務必加上 --directory . 參數，才能將專案檔案建立在本 Dev Container 的 /workspace 目錄下。
'
if [ ! -f /workspace/package.json ]; then
  echo "$usage"
fi
