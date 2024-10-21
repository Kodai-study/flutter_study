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
      home: const MyHomePage(title: 'じゃんけんゲーム'),
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
  void showEnemyHand() {
    List<String> hands = ["グー", "チョキ", "パー"];
    //ランダムに並び替えた後、最初の要素を取得
    hands.shuffle();
    String enemyHand = hands.first;

    Map<String, String> handImageMap = {
      "グー": "assets/janken_gu.png",
      "チョキ": "assets/janken_choki.png",
      "パー": "assets/janken_pa.png"
    };

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("相手の手"),
          content: Image.asset(handImageMap[enemyHand]!),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              showEnemyHand();
            },
            child: const Text("じゃんけんをします")),
      ),
    );
  }
}
