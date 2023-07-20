import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CounterPage(),
    );
  }
}


class CounterController extends GetxController {

  //第二种更新数据：需要手动调用update，配合gexbuilder
  int count = 0;

  void increment() {
    count++;
    update();
  }

}


class CounterPage extends StatelessWidget {

  var count = 0.obs; //数量

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
      ),
      body: Center(
        child: GetBuilder<CounterController>(
          init: CounterController(),
          builder: (controller) {
            return Text("${controller.count}", style: TextStyle(fontSize: 50),);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CounterController controller = Get.find();
          controller.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}



// 第一种：响应变量，数据改变，界面改变
// class CounterPage extends StatelessWidget {
//
//   var count = 0.obs; //数量
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Counter"),
//       ),
//       body: Center(
//         child: Obx(() => Text("${count.value}", style: TextStyle(fontSize: 50),)),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => count++,
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }


