import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start;
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start;

  exchangeMainAxisAlignment() {
    setState(() {
      switch (mainAxisAlignment) {
        case MainAxisAlignment.start:
          mainAxisAlignment = MainAxisAlignment.center;
          break;
        case MainAxisAlignment.center:
          mainAxisAlignment = MainAxisAlignment.end;
          break;
        case MainAxisAlignment.end:
          mainAxisAlignment = MainAxisAlignment.start;
          break;
        default:
          mainAxisAlignment = MainAxisAlignment.start;
      }
    });
  }

  exchangeCrossAxisAlignment() {
    setState(() {
      switch (crossAxisAlignment) {
        case CrossAxisAlignment.start:
          crossAxisAlignment = CrossAxisAlignment.center;
          break;
        case CrossAxisAlignment.center:
          crossAxisAlignment = CrossAxisAlignment.end;
          break;
        case CrossAxisAlignment.end:
          crossAxisAlignment = CrossAxisAlignment.start;
          break;
        default:
          crossAxisAlignment = CrossAxisAlignment.start;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
            children: [
              Container(
                color: Colors.red,
                width: 200,
                height: 200,
              ),
              Container(
                color: Colors.blue,
                width: 150,
                height: 150,
              ),
              Container(
                color: Colors.green,
                width: 100,
                height: 100,
              ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Column(
              children: [
                OutlinedButton(
                    onPressed: exchangeMainAxisAlignment,
                    child: Text(mainAxisAlignment.toString())),
                OutlinedButton(
                    onPressed: exchangeCrossAxisAlignment,
                    child: Text(crossAxisAlignment.toString())),
              ],
            ),
          )
        ],
      ),
    );
  }
}
