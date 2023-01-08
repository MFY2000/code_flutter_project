import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code in Fultter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
          length: 3,
          child: Scaffold(
              appBar: AppBar(
                bottom: const TabBar(
                  tabs: [
                    Tab(child: Text("Task 1 (Basic text)")),
                    Tab(child: Text("Task 2 (Image text)")),
                    Tab(child: Text("Task 3 (Running text)"))
                  ],
                ),
              ),
              body: const TabBarView(children: [
                Tab(child: Task01()),
                Tab(child: Text("Task 2 ")),
                Tab(child: Text("Task 3 "))
              ]))),
    );
  }
}

class Task01 extends StatelessWidget {
  const Task01({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
              child: Column(
            children: [
              Text("happy Birthday to"),
              Text("Muhammad Fahad"),
            ],
          )),
        ],
      ),
    );
  }
}
