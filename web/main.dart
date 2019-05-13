import 'dart:html';
void main() {
  querySelector('#output').text = 'Your Dart app is running.';
  test();
}

void test(){
  print('233333');
  var bar = '23333';
  // bar = 23; 这里会报错。因为bar在初始化的时候，被定义为string类型，后边只能赋值string类型
  print(bar);
  int lineCount;
  // lineCount = 23.5; 
  lineCount = 25;//只能赋值整数
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
}
