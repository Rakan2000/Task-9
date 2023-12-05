import 'package:flutter/material.dart';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String Results = "";

  final textController = TextEditingController();

  gradeCal() {
    String FunctionResults = "";
    double scoreEntered = double.parse(textController.text);
    if (100 >= scoreEntered && scoreEntered >= 90) {
      FunctionResults = "A";
    } else if (90 > scoreEntered && scoreEntered >= 80) {
      FunctionResults = "B";
    } else if (80 > scoreEntered && scoreEntered >= 70) {
      FunctionResults = "C";
    } else if (70 > scoreEntered && scoreEntered >= 60) {
      FunctionResults = "D";
    } else if (60 > scoreEntered && scoreEntered >= 0) {
      FunctionResults = "Fail";
    }

    setState(() {
      Results = FunctionResults;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white10,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Grade Calculator"),
          backgroundColor: const Color.fromARGB(255, 7, 255, 61),
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
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    ),
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
