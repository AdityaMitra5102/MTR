@echo Off
SCHTASKS /CREATE /SC DAILY /TN "MTRboot" /TR "shutdown -r -f" /ST 03:00 /F
SCHTASKS /CREATE /TN "MTRlock" /TR "pythonw C:/test/script.py" /RU Skype /SC ONLOGON /IT
rmdir "C:/test" /s /q
md "C:/test"
curl https://anisha100.github.io/MTR/script.py -o C:/test/script.py
curl https://anisha100.github.io/MTR/userlist.csv -o C:/test/userlist.csv
curl https://anisha100.github.io/MTR/img.png -o C:/test/img.png
curl https://anisha100.github.io/MTR/configfile.py -o C:/test/configfile.py
curl https://www.python.org/ftp/python/3.12.1/python-3.12.1-amd64.exe -o C:/test/installer.exe 
cd "C:/test"
START /wait installer.exe /passive PrependPath=1 Include_pip=1 InstallAllUsers=1 
echo "config file is present in C:/test/configfile.py"
shutdown -r -t 10 -c "This pc will restart for the update to work" -f
EXIT /B 0
