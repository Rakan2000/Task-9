import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String Results = "results";

  final textController = TextEditingController();

  gradeCal() {
    double scoreEntered = double.parse(textController.text);
    if (scoreEntered >= 90) {
      setState(() {
        Results = "A";
      });
    } else if (scoreEntered >= 80) {
      setState(() {
        Results = "B";
      });
    } else if (scoreEntered >= 70) {
      setState(() {
        Results = "C";
      });
    } else if (scoreEntered >= 60) {
      setState(() {
        Results = "D";
      });
    } else {
      setState(() {
        Results = "Fail";
      });
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white10,
        appBar: AppBar(
          title: Text("grade calculator"),
          backgroundColor: Colors.amber,
        ),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: textController,
                  decoration: InputDecoration(
                    hintText: "Type your score",
                    prefixIcon: Icon(
                      Icons.percent,
                      color: Colors.black26,
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Score',
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                gradeCal();
              },
              child: Text("calculate"),
            ),
            Text(
              "$Results",
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.6),
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            // SizedBox(width: double.infinity),
          ],
        )),
      ),
    );
  }
}
