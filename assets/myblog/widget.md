## 前言

Flutter Widget采用现代响应式框架构建，通俗的说，就是数据和UI绑定，数据变化UI自动变化，类似于Android的databing。其实完全可以吧widget看成Android的View

## 正文

Widget就是一个UI描述，一个简单的widget如下：

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    new Center(
      child: new Text(
        'Hello, world!',
        textDirection: TextDirection.ltr,
      ),
    ),
  );
}

```

这里的```Center```和``` Text```都是widget。这就可以在屏幕中间显示一个hello，world。

根据flutter的官方文档，一下widget比较常用：

- [`Text`](https://docs.flutter.io/flutter/widgets/Text-class.html)：该 widget 可让创建一个带格式的文本。
- [`Row`](https://docs.flutter.io/flutter/widgets/Row-class.html)、 [`Column`](https://docs.flutter.io/flutter/widgets/Column-class.html)： 这些具有弹性空间的布局类Widget可让您在水平（Row）和垂直（Column）方向上创建灵活的布局。其设计是基于web开发中的Flexbox布局模型。
- [`Stack`](https://docs.flutter.io/flutter/widgets/Stack-class.html)：  取代线性布局 (译者语：和Android中的LinearLayout相似)，[`Stack`](https://docs.flutter.io/flutter/widgets/Stack-class.html)允许子 widget 堆叠， 你可以使用 [`Positioned`](https://docs.flutter.io/flutter/widgets/Positioned-class.html) 来定位他们相对于`Stack`的上下左右四条边的位置。Stacks是基于Web开发中的绝度定位（absolute positioning )布局模型设计的。
- [`Container`](https://docs.flutter.io/flutter/widgets/Container-class.html)： [`Container`](https://docs.flutter.io/flutter/widgets/Container-class.html) 可让您创建矩形视觉元素。container 可以装饰为一个[`BoxDecoration`](https://docs.flutter.io/flutter/painting/BoxDecoration-class.html), 如 background、一个边框、或者一个阴影。 [`Container`](https://docs.flutter.io/flutter/widgets/Container-class.html) 也可以具有边距（margins）、填充(padding)和应用于其大小的约束(constraints)。另外， [`Container`](https://docs.flutter.io/flutter/widgets/Container-class.html)可以使用矩阵在三维空间中对其进行变换。

接下来一小节我们一一详细介绍以上常用的widget。

### 2.1 Text

基本的使用包括：

```dart
Text(
  'Hello, $_name! How are you?',
  textAlign: TextAlign.center,
  overflow: TextOverflow.ellipsis,
  style: TextStyle(fontWeight: FontWeight.bold),
)
```

四个变量都是比较好理解，这里不再详细介绍

高阶用法主要可以通过构造函数Text.rich来支持 TextSpans，具体可以参考DefaultTextStyle来设置风格。

### 2.2 Row 、Column 

行和列，一般预期是子元素不能超过总大小，子Widget必须是Expanded。



### 2.3 Container

一个矩形区域，