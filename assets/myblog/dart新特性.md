## 前言

dart是一种很像java的语言，设计核心思想基本上和java一样。但是有部分很强大的特性，这里需要介绍一下。

## 正文

#### 变量

变量标识使用现代语言标准的语法var，可以省略，可以直接声明

```dart
var i = 2;
int i2 = 2；    
```

#### 数据类型

dart内建类型

- Number
- String
- Boolean
- List (也被称为 *Array*)
- Map
- Set
- Rune (用于在字符串中表示 Unicode 字符)
- Symbol

Const final 以及static和java类似，虽说使用方法不太一样，但是基本可有忽略。

#### 集合

略

#### 方法

1. 方法是一等对象，一个函数可以作为另一个函数的参数
2. 匿名函数，类似于c++的函数指针



#### 运算符

1. 联机运算符(..)

   ```dart
   querySelector('#confirm') // 获取对象。
     ..text = 'Confirm' // 调用成员变量。
     ..classes.add('important')
     ..onClick.listen((e) => window.alert('Confirmed!'));
   ```

#### 类

Dart 是一种基于类和 mixin 继承机制的面向对象的语言

Mixin 是复用类代码的一种途径，复用的类可以在不同层级，之间可以不存在继承关系。通过 `with` 后面跟一个或多个混入的名称，来 *使用* Mixin ，
下面的示例演示了两个使用 Mixin 的类：

```dart
class Musician extends Performer with Musical {
  // ···
}

class Maestro extends Person
    with Musical, Aggressive, Demented {
  Maestro(String maestroName) {
    name = maestroName;
    canConduct = true;
  }
}
```

字符串不用+拼接，如下

```dart
var str = 'Hello, $name! You are ${year - birth} years old.';
'Hello, ' + name + '! You are ' + (year - birth).toString() + ' y...';
```



集合可以同骚操作，类似Rxjava的链式调用，如：

```dart
var aquaticNames = animals
    .where((animal) => animal.isAquatic)
    .map((animal) => animal.name);
    
    people.forEach((person) {
  ...
});
```

复制操作

```dart
var copy1 = iterable.toList();
var copy2 = List.from(iterable);
```

支持whereType 

```dart
var objects = [1, "a", 2, "b", 3];
var ints = objects.whereType<int>();
```

dart 最屌的语法之一是可选参数和可默认参数的语法

```dart
void insert(Object item, {int at = 0}) { ... }
```

