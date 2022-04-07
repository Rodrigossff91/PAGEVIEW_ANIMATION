import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController controller;

  double currentPage = 0.0;

  @override
  void initState() {
    controller = PageController();
    controller.addListener(() {
      setState(() {
        currentPage = controller.page ?? 0.0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("PageView Animation"),
        ),
        body: PageView.builder(
            controller: controller,
            itemCount: 10,
            itemBuilder: ((context, page) {
              late double value;

              if (page <= currentPage.floor()) {
                value = currentPage - page;
                value = 1 - value;
              } else if (page > currentPage.floor()) {
                value = page - currentPage;
                value = 1 - value;
              }

              return Opacity(
                opacity: value,
                child: Container(
                  child: Center(child: Text("Page $page")),
                  color: page % 2 == 0 ? Colors.red : Colors.green,
                ),
              );
            })));
  }
}
