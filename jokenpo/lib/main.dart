import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyHomePage(title: 'Jokenpô!');
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum JokenpoChoice { rock, scissors, paper }

extension JokenpoChoicePtBr on JokenpoChoice {
  String translate() {
    switch (this) {
      case JokenpoChoice.rock:
        return 'Pedra';
      case JokenpoChoice.paper:
        return 'Papel';
      case JokenpoChoice.scissors:
        return 'Tesoura';
    }
  }
}

enum GameResult { win, lose, draw }

extension GameResultPtBr on GameResult {
  String translate() {
    switch (this) {
      case GameResult.win:
        return 'Vitória';
      case GameResult.lose:
        return 'Derrota';
      case GameResult.draw:
        return 'Empate';
    }
  }
}

class _MyHomePageState extends State<MyHomePage> {
  late JokenpoChoice machineChoice;
  late GameResult gameResult;
  var gameover = false;
  int wins = 0;
  int losses = 0;

  void checkGame(JokenpoChoice playerChoice) {
    switch (Random().nextInt(3)) {
      case 0:
        machineChoice = JokenpoChoice.rock;
        break;
      case 1:
        machineChoice = JokenpoChoice.paper;
        break;
      case 2:
        machineChoice = JokenpoChoice.scissors;
        break;
    }
    if (playerChoice == machineChoice) {
      setState(() {
        gameResult = GameResult.draw;
        gameover = true;
      });
      return;
    }
    switch (playerChoice) {
      case JokenpoChoice.rock:
        if (machineChoice == JokenpoChoice.paper) {
          setState(() {
            gameResult = GameResult.lose;
            losses++;
          });
        } else {
          setState(() {
            gameResult = GameResult.win;
            wins++;
          });
        }
        break;
      case JokenpoChoice.paper:
        if (machineChoice == JokenpoChoice.rock) {
          setState(() {
            gameResult = GameResult.win;
            wins++;
          });
        } else {
          setState(() {
            gameResult = GameResult.lose;
            losses++;
          });
        }
        break;
      case JokenpoChoice.scissors:
        if (machineChoice == JokenpoChoice.rock) {
          setState(() {
            gameResult = GameResult.lose;
            losses++;
          });
        } else {
          setState(() {
            gameResult = GameResult.win;
            wins++;
          });
        }
        break;
    }
    setState(() {
      gameover = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Jokenpô!',
        theme: ThemeData(
          primarySwatch: !gameover
              ? Colors.blue
              : (gameResult == GameResult.win ? Colors.green : Colors.red),
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                        ElevatedButton(
                            onPressed: () => checkGame(JokenpoChoice.rock),
                            child: Image.asset('assets/images/rock.png')),
                        ElevatedButton(
                            onPressed: () => checkGame(JokenpoChoice.paper),
                            child: Image.asset('assets/images/paper.png')),
                        ElevatedButton(
                            onPressed: () => checkGame(JokenpoChoice.scissors),
                            child: Image.asset('assets/images/scissors.png'))
                      ])),
                  AnimatedContainer(
                    curve: Curves.easeIn,
                    duration: const Duration(seconds: 1),
                    height: !gameover ? 0 : 250,
                    child: gameover
                        ? Column(children: [
                            Text(
                              'Escolha da máquina: ${machineChoice.translate()}',
                              textScaleFactor: 3,
                            ),
                            Text(
                              gameResult.translate(),
                              textScaleFactor: 3,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('$wins - vitórias'),
                                Text('$losses - derrotas')
                              ],
                            )
                          ])
                        : const Text(
                            'Jokenpô!',
                            textScaleFactor: 5,
                          ),
                  )
                ],
              ),
            )));
  }
}
