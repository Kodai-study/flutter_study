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
                SizedBox(
                  width: 200,
                  height: 500,
                  child: ListView(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.access_time),
                        title: const Text("リストビューの要素(ListTile)1つ目"),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.account_tree),
                        title: const Text("リストビューの要素(ListTile)2つ目"),
                        trailing: const Icon(Icons.arrow_back),
                        onTap: () {},
                      ),
                      Container(
                        color: Colors.pink,
                        height: 200,
                        child: const Text(
                          "リストビューの要素(Container)1つ目",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      Container(
                        color: Colors.red,
                        height: 200,
                      ),
                      Container(
                        color: Colors.blue,
                        height: 200,
                      ),
                      Container(
                        color: Colors.purple,
                        height: 200,
                      ),
                      Container(
                        color: Colors.black,
                        height: 200,
                      ),
                      Container(
                        color: Colors.greenAccent,
                        height: 200,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    color: Colors.yellow,
                    width: 100,
                    height: 50,
                  ),
                  Container(
                    color: Colors.purple,
                    width: 400,
                    height: 50,
                    child: const Text(
                        "SingleChildScrollView、scrollDirection: Axis.horizontalで横にスクロールします"),
                  ),
                  Container(
                    color: Colors.orange,
                    width: 100,
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
