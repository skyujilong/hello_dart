import 'dart:html';
import 'dart:convert';

//引入本地的文件，进行执行测试
import 'demo/index.dart';

void main() {
  // .. 级联操作符
  print(querySelector('#output').text='w233');//输出w233
  querySelector('#output')..text = 'Your Dart app is running.'..style.setProperty('color', 'red');//输出红色：Your Dart app is running.
  test();
}

void test(){
  print('233333');
  var bar = '23333';
  // bar = 23; 这里会报错。因为bar在初始化的时候，被定义为string类型，后边只能赋值string类型
  print(bar);
  int lineCount;
  // lineCount = 23.5; 
  lineCount ??= 25;//只能赋值整数 ??代表，在原来值为null的情况下，进行赋值，否则不进行赋值
  print('lineCount 在没有值的情况下，被赋值为${lineCount}');
  double bar1 = 23.1;//双精度
  final bar2 = '23';
  // final bar3 ; 会报错， 必须直接给值， 这里可以使用const 这个关键字 ，后续赋值
  // bar2 = 'test'; final & const 都是赋值过一次就不能再次赋值了
  var list = [1,2,3,'4'];
  
  print(int.parse(list[3]));
  print(list);
  print(list[3] == 4);

  List<String> list1 = [];
  list1.add('2333');
  list1.add('111');
  print(list1);
  void testArray(List<String> arg1){

    arg1.forEach((item){
      bool isString = item is String;
      print('123');
      print('类型是否是string类型：${isString}');
      //这个就是匿名函数
      print(item);
    });
  }
  testArray(list1);
  testClass();
  testFun();
}


void testFun(){
  int sort(Object a, Object b) => 0;
  print(sort is Function);
  SortedCollection coll = new SortedCollection(sort);
  print(coll.compare is Function);
}

void testClass(){
  // var jsonData = JsonDecoder.convert('{"x":1, "y":2}');
  var jd = new JsonDecoder();
  var jdResult = jd.convert('{"x":1, "y":2}');
  print('JsonDecoder转化json字符串为对象，${jdResult}');
  print('是否还是字符串${jdResult is String}');

  print('jdResult is Map:${jdResult is Map}');
  
    // Create a Point using Point().
    var p1 = new Point(2, 2);
    print(p1);
    // Create a Point using Point.fromJson().
    var p2 = new Point.fromJson(jdResult);
    print(p2);


  // 先调用对应的super fromJson，之后在调用 当前的fromJson
  new Employee.fromJson(new Map());

  // 接口
  print(greetBob(new Person1('jilong5')));
  print(greetBob1(new Imposter()));

  //加法调用
  print('加法调用${plus(1,2)}');
}
class Point {
    num x;
    num y;

    Point(this.x, this.y);

    // Named constructor
    Point.fromJson(Map json) {
      x = json['x'];
      y = json['y'];
    }
  }



class Person {
  String firstName;
  Person(){
    print('默认构造器');
  }
  Person.fromJson(Map data) {
    print('in Person');
  }
}


class Employee extends Person{
  // Employee.fromJson(Map json):super.fromJson(json){
  //   print('employee');
  // }
  Employee(){
    print('默认的');
  }
  Employee.fromJson(Map json){
    print(json);
  }
}


class Person1 {
  // In the interface, but visible only in this library.
  final _name;

  // Not in the interface, since this is a constructor.
  Person1(this._name);

  // In the interface.
  String greet(who) => 'Hello, $who. I am $_name.';
}
// An implementation of the Person interface.
class Imposter implements Person1 {
  // We have to define this, but we don't use it.
  final _name = "";

  String greet(who) => 'Hi $who. Do you know who I am?';
}

greetBob(Person1 person) => person.greet('bob');
greetBob1(Imposter imposter) => imposter.greet('2333');



class SortedCollection {
  Function compare;
  // 传递进来的function，并且重新命名为compare方法
  SortedCollection(int f(Object a, Object b)) {
    compare = f;
  }
}