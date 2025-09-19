# Laser-Displacement-Meter
裝置說明:  
**雷射位移計**:IL-S065  
**訊號放大器**:IL-1000  
**通訊模組**:DL-EN1  
## 使用方式
先將各裝置連接，並透過網路線連接PC。
### 設定硬體ip位置
開啟[ip setting tool](https://eu.jvc.com/pro/support/firmware/ip-setting-tool/)，找到其中MAC地址相同的裝置，並設定其ip。
<img width="1008" height="374" alt="螢幕擷取畫面 2025-09-19 154557" src="https://github.com/user-attachments/assets/747d461c-0fd5-458a-ac78-32a648ffafe6" />
MAC地址為硬體所設定，不會改變。

### 透過TCP/IP進行連線


使用MATLAB建立TCP/IP  

``` matlab
laser = tcpclient("xxx.xxx.xxx.xxx",64000);
configureTerminator(laser,"CR/LF");
```
| 指令 | 回傳 | 功能 |
| -- | -- |--|
| M0 | M0,[第一個讀值],[第二個讀值],... |讀取每一個敢測器的值 |
| MS |MS,[輸出狀態*],[第一個讀值],[輸出狀態*],[第二個讀值],... |讀取每個感測器的狀態及值  |
| SR,[ID],[指令*] |  SR,[ID],[指令*],[回傳值]  |查詢暫存器狀態 | 

輸出狀態*:位移計是否超出量測範圍或出現Err，可查詢DL-EN1手冊中2-10  
指令*:可查詢DL-EN1手冊中3-1  
<img width="575" height="329" alt="image" src="https://github.com/user-attachments/assets/50a2bae9-9fed-4592-874c-aa5d93b93aa1" />  
