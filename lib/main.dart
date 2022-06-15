import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Dice App'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: const DicePage(),
      ),
    ),
  );
}
class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNum = 1;
  int rightDiceNum = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              style:
              TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
              onPressed: () {
                updateDiceNum();
                var snackBar = const SnackBar(
                  content: Text('Left Dice Rolled'),
                );
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Image.asset('images/dice$leftDiceNum.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              style:
              TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
              onPressed: () {
                updateDiceNum();
                var snackBar = const SnackBar(
                  content: Text('Right Dice Rolled'),
                );
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Image.asset('images/dice$rightDiceNum.png'),
            ),
          ),
        ],
      ),
    );
  }
  void updateDiceNum(){
    setState(() {
      leftDiceNum = Random().nextInt(6) + 1;
      rightDiceNum = Random().nextInt(6) + 1;
    });
  }
}
