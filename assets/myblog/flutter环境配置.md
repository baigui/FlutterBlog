## 前言

一直希望自己写一个博客网站，但是因为自己不太擅长写web网站，一直有所搁置，最近发现flutter是支持web的，就计划通过自己的一个小网站，顺便学习一下flutter。

## 正文

github上显示Flutter的简介：

> Flutter is Google's SDK for crafting beautiful, fast user experiences for
> mobile, web and desktop from a single codebase. Flutter works with existing
> code, is used by developers and organizations around the world, and is free
> and open source.
>
> Flutter是Google公司精心制作的，漂亮的SDK，该SDK通过使用一套基础代码库使手机、web、桌面端的开发效率大大提高。Flutter可以和现有代码混合开发，被全球的开发者和组织使用。并且它也是开源和自由的。

总之Flutter是支持移动端、web和桌面。目前Flutter主要方向还是移动端，主要支持Android和ios。web端已经进入deta版本，这是我们这个系列的文章主要关注的方向。桌面端目前支持最好的macos，已经进入alpha版本，Windows还处于早期的预览版本，主要是基于win32位应用。

Flutter的编程语言Dart，是一种现代化的语言。这里不再详细介绍 [dart语法简介](https://www.dartcn.com/guides/language/language-tour) 

而Flutter是基于Dart，又加入了一些新的类（SDK），方便快捷开发。

### 开发环境配置

目前flutter支持三种环境的搭建，这里我们一一介绍

#### 移动端环境搭建

关于基础的ios和Android开发环境配置，具体步骤如下：

1. 安装Android studio
2. 在Android studio的插件市场中，下载Flutter插件。
3. 重启你的Android studio，你就可以新建Flutter项目了。
4. 在新建项目过程中，Android studio会提示下载Flutter 的SDK。
5. 按照提示下载完成Flutter SDK，就可以新建一个支持Android 和iOS的跨平台应用了。

#### web端

因为web分支目前在beta版本上，需要切换到beta分支上。

在配置基础的开发环境中，记住刚才下载SDK的路径，找到bin目录，吧她加入到windows的path环境变量中，

然后在cmd中运行三条指令

```bash
 flutter channel beta  # 切换分支
 flutter upgrade # 更新代码
 flutter config --enable-web ## 配置支持web
```

如果你的电脑电脑安装了Chrome浏览器，可以通过指令

``` 
C:\Users\destop>flutter devices
3 connected devices:

MI 8       • b5050986   • android-arm64  • Android 10 (API 29)
Chrome     • chrome     • web-javascript • Google Chrome 80.0.3987.149
Web Server • web-server • web-javascript • Flutter Tools
```

就可以看到我们已经有chrome的设备了。

下面启动我们的Android stuido，就可以在我们的运行设备的下拉列表中找到我们的chrome，电机run按钮，最终可以启动chrome浏览器，生成我们的第一个工程

#### 桌面端

桌面端目前支持三种系统，macos、windows、linux。我这里只稍加介绍，不会过多介绍

桌面端基本上和web端差不多，通过特定的分支，来实现功能如下

```bash
 flutter channel master

 flutter upgrade

 flutter config --enable-macos-desktop
```

## 后记

这里我们已经完成了我们的环境搭建



## 特殊问题

1. 目前windows端更新flutter貌似会有问题，会自动使用系统的下载服务下载文件，然后下载不了，我是通过结束进程来使用flutter自带的下载器下载。

2. 配置下载路径，因为没有梯子，目前dart下载文件一直timeout，可以通过配置如下系统变量解决问题：

```
 PUB_HOSTED_URL=https://pub.flutter-io.cn
 FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
```

window中，在环境变量里面新的一些变量。

## 参考

[Flutter 桌面环境配置](https://flutter.dev/desktop) 

[Flutter web环境搭建](https://flutter.dev/web)

[Flutter github](https://github.com/flutter/flutter) 

