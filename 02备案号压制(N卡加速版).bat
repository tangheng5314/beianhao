@echo off
title ����������ѹ��(N�����ٰ�)
echo=
echo=
echo      ����������ѹ�� (N�����ٰ�)
echo=
echo=
echo      �������ڣ�2023��12��13��
echo=
echo=
echo      �˰汾��������ͨ�����ŵ�ѹ�ƣ��Կ�����ΪNVIDIAϵ��
echo=
echo=
echo      �̶������Ƶ����Ϊ6000k
echo=
echo=
echo     ������Ƶ©�ӻ�����Ӳ��ϱ����ţ�ԭ����ԭ��Ƶ����1920*1080����ʹ�á�03���÷ֱ���Ϊ1080P.bat�����д���
echo=
echo=
set shichang=7
set geshi=*.mp4 *.mov
set var1=�����ţ�
set /p var2=�����뱸���ţ����磺0108283210604010��:
set /p shichang=�����뱸���ų���ʱ�䣨�磺5�����ʱ�����õ���5�룩��Ҳ��ֱ�ӻس������˲���ʹ��Ĭ��ֵ��7�룩��


md ���������
 
echo ���ڽ��б�����������Ժ󡣡���
 
for %%a in (%geshi%) do (
	echo ��ǰ���ڽ��е���Ƶ��%%a

	ffmpeg -c:v h264_cuvid -threads 20 -i "%%a" -filter_complex "drawtext=fontfile=C\\:/Windows/logo/SH.otf:text='%var1%%var2%':x=1300:y=900:fontsize=41:fontcolor=fafafa:shadowy=3:bordercolor=000000:borderw=1:enable='between(t,0,%shichang%)'" -b:v 6000k -c:v h264_nvenc "���������\%%~na.mp4" 
)
start ���������
echo=
echo=
echo ������ѹ����ɣ�
echo=
echo ���ڴ򿪵�ǰĿ¼�µġ�������������ļ��С�����������
echo=
echo=
echo �밴������˳�
 
pause