@echo off

REM 预设的当前本地版本
SET local_version=1.0.0

REM 通过 curl 获取 Github 上的版本信息
curl https://raw.githubusercontent.com/tangheng5314/beianhao/main/version.txt
REM 读取服务器上的版本信息
SET /p server_version=<server_version.txt

REM 比较版本
IF NOT "%local_version%"=="%server_version%" (
    REM 如果服务器版本新，下载新的 bat 文件
    curl https://raw.githubusercontent.com/username/repo/main/my_script.bat -o my_script.bat
  
    REM 显示更新成功的信息
    echo Update successful.
  
    REM 可以在此处添加其它必要的操作
)

REM 继续执行你其它的代码
echo Running the rest of your script...
title 备案号批量压制(N卡加速版)
echo=
echo=
echo      备案号批量压制 (N卡加速版)
echo=
echo=
echo      更新日期：2023年12月13日
echo=
echo=
echo      此版本适用于普通备案号的压制，显卡必须为NVIDIA系列
echo=
echo=
echo      固定输出视频码率为6000k
echo=
echo=
echo     部分视频漏加或者添加不上备案号，原因是原视频不是1920*1080，请使用【03设置分辨率为1080P.bat】进行处理
echo=
echo=
set shichang=7
set geshi=*.mp4 *.mov
set var1=备案号：
set /p var2=请输入备案号（例如：0108283210604010）:
set /p shichang=请输入备案号持续时间（如：5，最低时长不得低于5秒）（也可直接回车跳过此步骤使用默认值：7秒）：


md 备案号输出
 
echo 正在进行备案号输出请稍后。。。
 
for %%a in (%geshi%) do (
	echo 当前正在进行的视频：%%a

	ffmpeg -c:v h264_cuvid -threads 20 -i "%%a" -filter_complex "drawtext=fontfile=C\\:/Windows/logo/SH.otf:text='%var1%%var2%':x=1300:y=900:fontsize=41:fontcolor=fafafa:shadowy=3:bordercolor=000000:borderw=1:enable='between(t,0,%shichang%)'" -b:v 6000k -c:v h264_nvenc "备案号输出\%%~na.mp4" 
)
start 备案号输出
echo=
echo=
echo 备案号压制完成！
echo=
echo 正在打开当前目录下的【备案号输出】文件夹。。。。。。
echo=
echo=
echo 请按任意键退出
 
pause
