// ignore_for_file: camel_case_types, prefer_const_constructors

import 'dart:math';

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
          length: 5,
          child: Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                  tabs: [
                    Tab(
                        child:
                            taskBarText(text: "Task 1", extra: "(Basic text)")),
                    Tab(
                        child:
                            taskBarText(text: "Task 2", extra: "(Image text)")),
                    Tab(child: taskBarText(text: "Task 3", extra: "(Racing)")),
                    Tab(
                        child:
                            taskBarText(text: "Task 4", extra: "(Dice Roll)")),
                    Tab(
                        child: taskBarText(
                            text: "Task 5", extra: "(Tip Calculator)")),
                  ],
                ),
              ),
              body: Container(
                margin: const EdgeInsets.all(20),
                child: const TabBarView(
                  children: [
                    Tab(child: Task01()),
                    Tab(child: Task02()),
                    Tab(child: Task03()),
                    Tab(child: Task04()),
                    Tab(child: Task05()),
                  ],
                ),
              ))),
    );
  }
}

class taskBarText extends StatelessWidget {
  String extra;
  String text;

  taskBarText({super.key, required this.text, required this.extra});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 11),
        ),
        Text(extra, style: const TextStyle(fontSize: 8)),
      ],
    );
  }
}

class Task01 extends StatelessWidget {
  const Task01({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          "Happy Birthday to",
          style: TextStyle(fontSize: 22),
        ),
        Text("- Muhammad Fahad"),
      ],
    );
  }
}

class Task02 extends StatelessWidget {
  const Task02({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image.network(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6QjkFpMGx7sQ5TFEoBlaPO7nPgRUW1zpi0Q&usqp=CAU",
        fit: BoxFit.cover,
      ),
    );
  }
}

class Task03 extends StatefulWidget {
  const Task03({super.key});

  @override
  State<Task03> createState() => _Task03State();
}

class _Task03State extends State<Task03> {
  double player1value = 0.0;
  double player2value = 0.0;
  double increment = 0.04;
  double player1score = 0.0;
  double player2score = 0.0;
  String won = "";
  @override
  Widget build(BuildContext context) {
    void update(double value, double value2) {
      setState(() {
        player1value += value;
        player2value += value2;
      });
    }

    void result() {
      if (player1value > player2value) {
        won = "Player 1 Won";
      } else {
        won = "Player 2 Won";
      }
    }

    void setScoreToResult() {
      if (player1value > 1.0) {
        player1value = 1.0;
      } else if (player2value > 1.0) {
        player2value = 1.0;
      }
    }

    void startRace() async {
      while (true) {
        if (player1value < 1.0 && player2value < 1.0) {
          await Future.delayed(Duration(milliseconds: 200));
          setState(() {
            player1score = Random().nextDouble() * increment;
            player2score = Random().nextDouble() * increment;
            update(player1score, player2score);
            setScoreToResult();
          });
        } else {
          break;
        }
      }
      result();
    }

    void reset() {
      setState(() {
        player1score = 0.0;
        player2score = 0.0;
        player1value = 0.0;
        player2value = 0.0;
        won = "";
      });
    }

    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Run a Race',
              style: TextStyle(fontSize: 30),
            ),
            won != ""
                ? SizedBox(
                    height: 20,
                  )
                : Container(),
            Text(
              won,
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              // padding: const EdgeInsets.all(20),
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Player 1',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  LinearBar(vlaue: player1value),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 60),
              width: 260,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    // '${(player1value * 100).toStringAsFixed(2)}%',
                    '${(player1value * 100).toStringAsFixed(2)}%',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    '100%',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              // padding: const EdgeInsets.all(20),
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Player 2',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  LinearBar(vlaue: player2value),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 60),
              width: 260,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    // '${((player2value * 100).toStringAsFixed(2))}%',
                    '${((player2value * 100).toStringAsFixed(2))}%',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    '100%',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        startRace();
                      },
                      child: Text('Start'),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        reset();
                      },
                      child: Text('Reset'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LinearBar extends StatelessWidget {
  double vlaue;
  LinearBar({super.key, required this.vlaue});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: LinearProgressIndicator(
        value: vlaue, // a value between 0 and 1
        backgroundColor: Colors.grey,
        minHeight: 30,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
      ),
    );
  }
}

class Task04 extends StatefulWidget {
  const Task04({super.key});

  @override
  State<Task04> createState() => _Task04State();
}

class _Task04State extends State<Task04> {
  int imageFace = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/d$imageFace.png'),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              imageFace = Random().nextInt(6) + 1;
            });
          },
          child: Text('Roll'),
        ),
      ],
    );
  }
}

class Task05 extends StatefulWidget {
  const Task05({super.key});

  @override
  State<Task05> createState() => _Task05State();
}

class _Task05State extends State<Task05> {
  final billAmountController = TextEditingController();
  final tipController = TextEditingController();
  double billAmount = 15;

  @override
  void initState() {
    // TODO: implement initState
    tipController.text = "0";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            "Calculate Tip",
            style: TextStyle(fontSize: 22),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: billAmountController,
            onChanged: ((value) => calculate()),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Bill Amount',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: tipController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Tip %',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Total Bill Amount: $billAmount",
            style: TextStyle(fontSize: 22),
          ),
        ],
      ),
    );
  }

  void calculate() {
    var billAmount = double.parse(billAmountController.text);
    var tipPercentage = 15;
    var tipAmount = billAmount * tipPercentage / 100;
    var totalAmount = billAmount + tipAmount;

    setState(() {
      tipController.text = tipAmount.toStringAsFixed(2);
      this.billAmount = totalAmount;
    });
  }
}
