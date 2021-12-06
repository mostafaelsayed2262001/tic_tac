import 'dart:math';
class Player {


  static List<int> playerX = [];
  static List<int> playerO = [];
}
extension ContainList on List {
  bool containList(int x, int y, [z]) {
    return contains(x) && contains(y) && contains(z);
  }
}
class Game {
  void playGame(int index, String activePlayer) {
    if (activePlayer == 'X')
      Player.playerX.add(index);
    else
      Player.playerO.add(index);
  }
  checkWinner() {
    String winner = '';
    if (Player.playerX.containList(0, 1, 2) ||
        Player.playerX.containList(3, 4, 5) ||
        Player.playerX.containList(6, 7, 8) ||
        Player.playerX.containList(0, 3, 6) ||
        Player.playerX.containList(1, 4, 7) ||
        Player.playerX.containList(2, 5, 8) ||
        Player.playerX.containList(0, 4, 8) ||
        Player.playerX.containList(2, 4, 6))
      winner = "x";
    else if (Player.playerO.containList(0, 1, 2) ||
        Player.playerO.containList(3, 4, 5) ||
        Player.playerO.containList(6, 7, 8) ||
        Player.playerO.containList(0, 3, 6) ||
        Player.playerO.containList(1, 4, 7) ||
        Player.playerO.containList(2, 5, 8) ||
        Player.playerO.containList(0, 4, 8) ||
        Player.playerO.containList(2, 4, 6))
      winner = "O";
    else
      winner = '';

    return winner;
  }

  Future<void> autoPlay(activalPlayer) async {
    int index = 0;
    List<int> emptyCells = [];
    for (var i = 0; i < 9; i++) {
      if (!(Player.playerX.contains(i) || Player.playerO.contains(i)))
        emptyCells.add(i);
    }

    if (Player.playerX.containList(0, 1) && emptyCells.contains(2))
      index = 2;
    else if (Player.playerX.containList(3, 4) && emptyCells.contains(5))
      index = 5;
    else if (Player.playerX.containList(6, 7) && emptyCells.contains(8))
      index = 8;
    else if (Player.playerX.containList(0, 3) && emptyCells.contains(6))
      index = 6;
    else if (Player.playerX.containList(1, 4) && emptyCells.contains(7))
      index = 7;
    else if (Player.playerX.containList(2, 5) && emptyCells.contains(8))
      index = 8;
    else if (Player.playerX.containList(0, 4) && emptyCells.contains(8))
      index = 8;
    else if (Player.playerX.containList(2, 4) && emptyCells.contains(6))
      index = 6;
    else {
      int randomInt = Random().nextInt(emptyCells.length);
      index = emptyCells[randomInt];
    }

    if (Player.playerX.containList(0, 2) && emptyCells.contains(1))
      index = 1;
    else if (Player.playerX.containList(3, 5) && emptyCells.contains(4))
      index = 4;
    else if (Player.playerX.containList(6, 8) && emptyCells.contains(7))
      index = 7;
    else if (Player.playerX.containList(0, 6) && emptyCells.contains(3))
      index = 3;
    else if (Player.playerX.containList(1, 7) && emptyCells.contains(4))
      index = 4;
    else if (Player.playerX.containList(2, 8) && emptyCells.contains(5))
      index = 5;
    else if (Player.playerX.containList(0, 8) && emptyCells.contains(4))
      index = 4;
    else if (Player.playerX.containList(2, 6) && emptyCells.contains(4))
      index = 4;
    else {
      int randomInt = Random().nextInt(emptyCells.length);
      index = emptyCells[randomInt];

    }

    if (Player.playerX.containList(2, 1) && emptyCells.contains(0))
      index = 0;
    else if (Player.playerX.containList(5, 4) && emptyCells.contains(3))
      index = 3;
    else if (Player.playerX.containList(8, 7) && emptyCells.contains(6))
      index = 6;
    else if (Player.playerX.containList(6, 3) && emptyCells.contains(0))
      index = 0;
    else if (Player.playerX.containList(7, 4) && emptyCells.contains(1))
      index = 1;
    else if (Player.playerX.containList(8, 5) && emptyCells.contains(2))
      index = 2;
    else if (Player.playerX.containList(8, 4) && emptyCells.contains(0))
      index = 0;
    else if (Player.playerX.containList(6, 4) && emptyCells.contains(2))
      index = 2;
    else {
      int randomInt = Random().nextInt(emptyCells.length);
      index = emptyCells[randomInt];

    }

    if (Player.playerO.containList(0, 1) && emptyCells.contains(2))
      index = 2;
    else if (Player.playerO.containList(3, 4) && emptyCells.contains(5))
      index = 5;
    else if (Player.playerO.containList(6, 7) && emptyCells.contains(8))
      index = 8;
    else if (Player.playerO.containList(0, 3) && emptyCells.contains(6))
      index = 6;
    else if (Player.playerO.containList(1, 4) && emptyCells.contains(7))
      index = 7;
    else if (Player.playerO.containList(2, 5) && emptyCells.contains(8))
      index = 8;
    else if (Player.playerO.containList(0, 4) && emptyCells.contains(8))
      index = 8;
    else if (Player.playerO.containList(2, 4) && emptyCells.contains(6))
      index = 6;
    else {
      int randomInt = Random().nextInt(emptyCells.length);
      index = emptyCells[randomInt];

    }

    if (Player.playerO.containList(0, 2) && emptyCells.contains(1))
      index = 1;
    else if (Player.playerO.containList(3, 5) && emptyCells.contains(4))
      index = 4;
    else if (Player.playerO.containList(6, 8) && emptyCells.contains(7))
      index = 7;
    else if (Player.playerO.containList(0, 6) && emptyCells.contains(3))
      index = 3;
    else if (Player.playerO.containList(1, 7) && emptyCells.contains(4))
      index = 4;
    else if (Player.playerO.containList(2, 8) && emptyCells.contains(5))
      index = 5;
    else if (Player.playerO.containList(0, 8) && emptyCells.contains(4))
      index = 4;
    else if (Player.playerO.containList(2, 6) && emptyCells.contains(4))
      index = 4;
    else {
      int randomInt = Random().nextInt(emptyCells.length);
      index = emptyCells[randomInt];
    }

    if (Player.playerO.containList(2, 1) && emptyCells.contains(0))
      index = 0;
    else if (Player.playerO.containList(5, 4) && emptyCells.contains(3))
      index = 3;
    else if (Player.playerO.containList(8, 7) && emptyCells.contains(6))
      index = 6;
    else if (Player.playerO.containList(6, 3) && emptyCells.contains(0))
      index = 0;
    else if (Player.playerO.containList(7, 4) && emptyCells.contains(1))
      index = 1;
    else if (Player.playerO.containList(8, 5) && emptyCells.contains(2))
      index = 2;
    else if (Player.playerO.containList(8, 4) && emptyCells.contains(0))
      index = 0;
    else if (Player.playerO.containList(6, 4) && emptyCells.contains(2))
      index = 2;
    else {
      int randomInt = Random().nextInt(emptyCells.length);
      index=emptyCells[randomInt];
    }



    playGame(index, activalPlayer);
  }
}




