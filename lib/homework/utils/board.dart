import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lesson_35/homework/utils/buttons.dart';
import 'package:lesson_35/homework/xo.dart';

int? randomInList;
int? randomInRow;
Random random = Random();
int listIchi = 0;
String currentSymbol = "X";
List<List<String>> board = List.generate(3, (_) => List.filled(3, ''));

class ShowBoard extends StatefulWidget {
  const ShowBoard({super.key});

  @override
  State<ShowBoard> createState() => _Showboard();
}

class _Showboard extends State<ShowBoard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < board.length; i++)
          Row(
            children: [
              for (int j = 0; j < board[i].length; j++)
                InkWell(
                  onTap: () {
                    while (true) {
                      // boslsa ishlamasligi uchun ustidan
                      if (board[i][j] == '') {
                        usertap(i, j);
                        setState(() {});
                        currentSymbol = (currentSymbol == 'X') ? 'O' : 'X';
                        checkWinner(context);
                        setState(() {});

                        makeComputerMove();
                        setState(() {});
                        currentSymbol = (currentSymbol == 'X') ? 'O' : 'X';
                        checkWinner(context);
                        setState(() {});
                      }
                      return;
                    }
                  },
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: Colors.brown,
                          width: j < board[i].length - 1 ? 1.0 : 0.0,
                        ),
                        bottom: BorderSide(
                          color: Colors.brown,
                          width: i < board.length - 1 ? 1.0 : 0.0,
                        ),
                      ),
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      board[i][j],
                      style: const TextStyle(
                        fontSize: 80,
                      ),
                    ),
                  ),
                ),
            ],
          ),
      ],
    );
  }
}

void usertap(int i, int j) {
  if (board[i][j] == '') {
    board[i][j] = currentSymbol;
  }
}

void makeComputerMove() {
  List<int> emptyIndices = [];
  for (int i = 0; i < board.length; i++) {
    for (int j = 0; j < board[i].length; j++) {
      if (board[i][j] == '') {
        emptyIndices.add(i * 3 + j); //almashtirish 2d to 1d
      }
    }
  }

  if (emptyIndices.isNotEmpty) {
    int randomIndex = emptyIndices[random.nextInt(emptyIndices.length)];
    int row = randomIndex ~/ 3;
    int col = randomIndex % 3;
    board[row][col] = 'O';
  }
}

void checkWinner(context) {
  // for (var i = 0; i < board.length; i++) {
  //   int xcount = 0;
  //   int ocount = 0;

  //   for (var j = 0; j < board[i].length; j++) {
  //     if (board[i][j] == "X") {
  //       xcount++;
  //       joycount++;
  //     } else if (board[i][j] == "O") {
  //       ocount++;
  //       joycount++;
  //     }
  //   }
  for (int i = 0; i < 3; i++) {
    if (board[i][0] != '' &&
        board[i][0] == board[i][1] &&
        board[i][0] == board[i][2]) {
      defineWinner(board[i][0], context);
      board = List.generate(3, (_) => List.filled(3, ''));

      return;
    }
  }

  // Check columns
  for (int i = 0; i < 3; i++) {
    if (board[0][i] != '' &&
        board[0][i] == board[1][i] &&
        board[0][i] == board[2][i]) {
      defineWinner(board[0][i], context);
      board = List.generate(3, (_) => List.filled(3, ''));

      return;
    }
  }

  // Check diagonals
  if (board[0][0] != '' &&
      board[0][0] == board[1][1] &&
      board[0][0] == board[2][2]) {
    defineWinner(board[0][0], context);
    board = List.generate(3, (_) => List.filled(3, ''));

    return;
  }
  if (board[0][2] != '' &&
      board[0][2] == board[1][1] &&
      board[0][2] == board[2][0]) {
    defineWinner(board[0][2], context);
    board = List.generate(3, (_) => List.filled(3, ''));
    return;
  }

  if (!board.any((row) => row.any((cell) => cell == ''))) {
    defineWinner('draw', context);
    board = List.generate(3, (_) => List.filled(3, ''));
    return;
  }
  //   if (xcount == 3) {
  //     defineWinner("X", context);
  //     board = List.generate(3, (_) => List.filled(3, ''));
  //   } else if (ocount == 3) {
  //     defineWinner("O", context);
  //     board = List.generate(3, (_) => List.filled(3, ''));
  //   } else if (joycount == 9) {
  //     defineWinner("draw", context);
  //   }
  // }
// checking winner
}

void defineWinner(String user, context) {
  if (user == "X") {
    userPoint++;
    Future winnerDialog = showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Congratulations! 🎉'),
        content: const Text('You are the best Winner !!!'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'Reset Game');
              userPoint = 0;
              compPoint = 0;
            },
            child: const Text('Reset Game'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'New Game'),
            child: const Text('New Game'),
          ),
        ],
      ),
    );
  } else if (user == "O") {
    compPoint++;
    Future winnerDialog = showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Congratulations! 🎉'),
        content: const Text('Computer is the best Winner !!!'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'Reset Game');
              userPoint = 0;
              compPoint = 0;
            },
            child: const Text('Reset Game'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'New Game'),
            child: const Text('New Game'),
          ),
        ],
      ),
    );
  } else if (user == "draw") {
    compPoint++;
    userPoint++;
    Future winnerDialog = showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Congratulations! 🎉'),
        content: const Text('Friendship wins Both of you get balls!!!'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'Reset Game');
              userPoint = 0;
              compPoint = 0;
            },
            child: const Text('Reset Game'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'New Game'),
            child: const Text('New Game'),
          ),
        ],
      ),
    );
  }
}

// currentSymbol = (currentSymbol == 'X') ? 'O' : 'X';
// do {
//   randomInList = Random().nextInt(3);
//   randomInRow = Random().nextInt(3);

//   for (int count = 0; count < board.length; count++) {
//     for (var l = 0; l < count; l++) {
//       board[count][l] = '';
//     }
//   }
// } while (board[randomInList!][randomInRow!] != '' || listIchi > 0);

// board[randomInList!][randomInRow!] = currentSymbol;
