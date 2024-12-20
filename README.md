﻿# WebPrint_New

a simple website to share your windows printers to others via web browsers.


## 使用方法

### I. 开启IIS 和 ASP支持

如果*已经开启* 或者 *windows server* 可**跳过**此步骤 。

Windows 系统包含IIS功能,但默认关闭，需要手动打开。

可以参考<http://jingyan.baidu.com/article/48206aeaaacd51216ad6b318.html>

具体步骤  
>
  1. 搜索 `Windows 功能`,或者打开控制面板
  2. 点击 `启用或者关闭Windows功能` 
  3. 勾选`Internet Information Services`(Internet信息服务) 和
	* 确保勾选子目录 `万维网服务`>`应用程序和开发功能`>`ASP.NET 4.x`(不同系统版本可能有区别)
	* 确保勾选子目录 `万维网服务`>`常见HTTP功能`>`静态内容``默认文档`
	* 确保勾选子目录下 `万维网服务`>`web管理工具`
  4. 点击确定,等待开启
>

### II. 下载代码

 1. 下载[代码](https://github.com/NewFuture/WebPrint/archive/master.zip) 
 2. 解压**替换**掉`C:\inetpub\wwwroot`下内容,(确保README.md同级文件在此根目录下)
 3. 浏览器打开 `localhost` 可以看到上传界面

### III. 配置

1. 修改临时文件夹权限`file`，添加`IIS_IUSRS`的写入权限
2. 修改IIS对应应用程序池权限为管理员权限（`IIS管理器` > `对应的应用程序池` > `高级设置` > `进程模型` > `标识` > `改为管理员账户`）
3. 若为x64系统，在bin目录下替换[SumatraPDF的64位版本](https://www.sumatrapdfreader.org/download-free-pdf-viewer)
4. 设置打印密码,修改[Web.config](https://github.com/NewFuture/WebPrint/blob/master/Web.config#L5)设置打印密码
5. 设置系统默认打印机即配置完成
6. 局域网其他电脑或手机在浏览器访问你的主机`IP`,`主机名`或`域名`可打印则部署成功

### 调试

使用 Visual Studio 打开网站即可

## 兼容支持

* 文件格式:
  * [x] PDF
  * [x] doc
  * [x] docx
  * [x] rtf
  * [x] png
  * [x] jpg
  * [x] tiff
  * [x] txt
* 功能设置：
  * [x] 份数设置
  * [x] 页码设置(pdf)
  * [x] 多文件上传

## 截图



## LICENSE

Apache2.0 LICENSE 并保留或添加源码链接`https://github.com/NewFuture/WebPrint`
