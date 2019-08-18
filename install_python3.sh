#删除python
rm -rf /usr/bin/python
#删除pip
rm -rf /usr/bin/pip
#修改yum的Shebang
sed -i "1s%.*%#! /usr/bin/python2%" /usr/bin/yum
#修改urlgrabber-ext-down的Shebang
sed -i "1s%.*%#! /usr/bin/python2%" /usr/libexec/urlgrabber-ext-down
#修改pip2
sed -i "1s%.*%#! /usr/bin/python2%" /usr/bin/pip2
#修改pip2.7
sed -i "1s%.*%#! /usr/bin/python2%" /usr/bin/pip2.7

#解压Python3源码包
tar xvf Python-3.6.7.tar.xz
#进入Python3源码目录
cd Python-3.6.7
#在Modules/Setup.dist中追加新配置
echo "readline readline.c -lreadline -ltermcap" >> Modules/Setup.dist
#安装readline模块
yum -y install readline readline-devel
#编译源码
./configure prefix=/usr/local/python3 --with-ssl
make && make install
#添加python3软链
ln -s /usr/local/python3/bin/python3 /usr/bin/python
#添加pip3软链
ln -s /usr/local/python3/bin/pip3 /usr/bin/pip
#修改pip3 Shebang
sed -i '1s%.*%#! /usr/bin/python%' /usr/bin/pip

rm -rf Python-3.6.7
