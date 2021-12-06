import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac/game_logic.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String activePlayer = 'X';
  bool gameOver = false;
  int turn = 0;

  String result = '';
  Game game = Game();
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xe6000926),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            SwitchListTile.adaptive(
                value: isSwitched,
                title: Text(
                  "Turn On / Off Two Player",
                  style: TextStyle(
                    fontSize: 28,
                  ),
                  textAlign: TextAlign.center,
                ),
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                }),
            Text(
              "It's $activePlayer Turn".toUpperCase(),
              style: TextStyle(
                fontSize: 52,
              ),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1,
                padding: EdgeInsets.all(16),
                children: List.generate(
                    9,
                    (index) => InkWell(
                          borderRadius: BorderRadius.circular(32),
                          onTap: gameOver ? null : () => _onTap(index),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).shadowColor,
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: Center(
                              child: Text(
                                Player.playerX.contains(index)
                                    ? 'X'
                                    : Player.playerO.contains(index)
                                        ? 'O'
                                        : '',
                                style: TextStyle(
                                  fontSize: 52,
                                  color: Player.playerX.contains(index)
                                      ? Colors.blue
                                      : Colors.pink,
                                ),
                              ),
                            ),
                          ),
                        )),
              ),
            ),
            Text(
              result.toUpperCase(),
              style: TextStyle(
                fontSize: 32,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  activePlayer = 'X';
                  gameOver = false;
                  turn = 0;
                  Player.playerX = [];
                  Player.playerO = [];
                  result = '';
                });
              },
              icon: Icon(Icons.replay),
              label: Text('Repeat The Game'),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).splashColor)),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  _onTap(int index) async {
    if ((Player.playerO.isEmpty || !Player.playerO.contains(index)) &&
        (Player.playerX.isEmpty || !Player.playerX.contains(index))) {
      game.playGame(index, activePlayer);
      repeatMethod();
      if (!isSwitched && !gameOver && turn != 9) {
        await game.autoPlay(activePlayer);
        repeatMethod();
      }
    }
  }

  void repeatMethod() {
    setState(() {
      activePlayer = (activePlayer == 'X') ? 'O' : 'X';
      turn++;
      String winnerPlayer = game.checkWinner();

      if (winnerPlayer != '') {
        gameOver = true;
        result = '$winnerPlayer Is The Winner';
      } else if (!gameOver && turn == 9) result = 'It\'s Draw';
    });
  }
}
