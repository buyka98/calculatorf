import 'package:calculatorf/button.dart';
import 'package:calculatorf/utils/calculator.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, dynamic> state = initialState;

  @override
  Widget build(BuildContext context) {
    void handleTap(String type, {dynamic value}) {
      print("response: ${calculator(type, value, state)}");
      setState(() {
        state = calculator(type, value, state);
      });
    }

    return Scaffold(
      backgroundColor: const Color(0xff202020),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 10),
            child: Text("${state["currentValue"]}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 42,
                )),
          ),
          Row(
            children: [
              Button(
                  text: "C",
                  theme: "secondary",
                  onPressed: () => handleTap("clear")),
              Button(
                  text: "+/-",
                  theme: "secondary",
                  onPressed: () => handleTap("posneg")),
              Button(
                  text: "%",
                  theme: "secondary",
                  onPressed: () => handleTap("percentage")),
              Button(
                  text: "/",
                  theme: "accent",
                  onPressed: () => handleTap("operator", value: "/")),
            ],
          ),
          Row(
            children: [
              Button(
                  text: "7", onPressed: () => handleTap("number", value: "7")),
              Button(
                  text: "8", onPressed: () => handleTap("number", value: "8")),
              Button(
                  text: "9", onPressed: () => handleTap("number", value: "9")),
              Button(
                  text: "x",
                  theme: "accent",
                  onPressed: () => handleTap("operator", value: "*")),
            ],
          ),
          Row(
            children: [
              Button(
                  text: "4", onPressed: () => handleTap("number", value: "4")),
              Button(
                  text: "5", onPressed: () => handleTap("number", value: "5")),
              Button(
                  text: "6", onPressed: () => handleTap("number", value: "6")),
              Button(
                  text: "-",
                  theme: "accent",
                  onPressed: () => handleTap("operator", value: "-")),
            ],
          ),
          Row(
            children: [
              Button(
                  text: "1", onPressed: () => handleTap("number", value: "1")),
              Button(
                  text: "2", onPressed: () => handleTap("number", value: "2")),
              Button(
                  text: "3", onPressed: () => handleTap("number", value: "3")),
              Button(
                  text: "+",
                  theme: "accent",
                  onPressed: () => handleTap("operator", value: "+")),
            ],
          ),
          Row(
            children: [
              Button(
                  text: "0",
                  size: "double",
                  onPressed: () => handleTap("number", value: "0")),
              Button(text: ".", onPressed: () => handleTap("point")),
              Button(text: "=", onPressed: () => handleTap("equal")),
            ],
          ),
        ],
      )),
    );
  }
}
