# docker-tesseract-train
> [Tesstrain](https://github.com/tesseract-ocr/tesstrain) 的 docker 環境, 已建構好 leptonica 及 tesseract, 開箱及用的訓練環境

## 安裝
```sh
# 啟動 docker container
docker-compose up -d
```

## 訓練
docker 容器將自動建立 tesstrain 資料夾並進行映射, 將待訓練圖像及轉錄內容放進 `tesstrain/data/MODEL_NAME-ground-truth`

詳細內容請見 [Provide ground truth](https://github.com/tesseract-ocr/tesstrain/blob/master/README.md#provide-ground-truth)

```sh
# 進入 docker container
docker-compose exec ubuntu bash

# 開始訓練
make training MODEL_NAME=foo START_MODEL=eng
```

詳細指令請見 [Train](https://github.com/tesseract-ocr/tesstrain#train)

### 字典問題
若未提供字典則受訓練的 `foo.traineddata` 在執行時會打印警告 `Failed to load any lstm-specific dictionaries for lang foo!!` (僅只打印警告不影響使用)

若需提供字典則需從 [langdata_lstm](https://github.com/tesseract-ocr/langdata_lstm/tree/master/eng) 下載  `.wordlist` `.numbers` `.punc` 檔案,
並自行建立 foo 資料夾於 `tesstrain/data/foo` 底下後再開始訓練

若不提供字典檔則無需自行建立資料夾, [Tesstrain](https://github.com/tesseract-ocr/tesstrain) 將自行建立所需資料夾及檔案
