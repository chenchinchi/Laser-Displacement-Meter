clear all;close all;clc;
% 1. 建立 TCP 連線
laser = tcpclient("169.254.181.110",64000);
configureTerminator(laser,"CR/LF");
% 2. 發送讀取位移的指令 (依照 Keyence 手冊命令格式)
writeline(laser, "M0");

% 3. 讀取回傳資料
pause(0.1); % 稍等一下，確保設備有時間回覆
if laser.NumBytesAvailable > 0
    data = readline(laser);
    disp("雷射量測值: " + data);
end

clear laser;