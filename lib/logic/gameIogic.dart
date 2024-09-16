// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Gameiogic {
  final List<String> displayEndx;
  int xwinner = 0;
  int owinner = 0;

  Function clearboard;
  Function(int xwins, int owins) updateWinners;

  Gameiogic(
    this.updateWinners,
    this.displayEndx,
    this.xwinner,
    this.owinner,
    this.clearboard,
  );

  void _showwinDialog(BuildContext context, String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          'Congratulations 🎊🎊',
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        content: Row(
          children: [
            Text(
              winner,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              '  won the Game!!',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        actions: [
          Center(
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {
                  clearboard();
                  Navigator.of(context).pop();
                },
                child: Text(
                  'play again',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )),
          )
        ],
      ),
    );
    if (winner == 'o') {
      owinner += 1;
    } else if (winner == 'x') {
      xwinner += 1;
    }
    updateWinners(xwinner, owinner);
  }

  void _showdrawDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => AlertDialog(
        content: Row(
          children: [
            Text(
              ' oops, game draw !!',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        actions: [
          Center(
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {
                  clearboard();
                  Navigator.of(context).pop();
                },
                child: Text(
                  'play again',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )),
          )
        ],
      ),
    );
  }

  void checkWinner(BuildContext context) {
    // Check for winner conditions
    if ((displayEndx[0] == displayEndx[1] &&
            displayEndx[0] == displayEndx[2]) &&
        displayEndx[0] != '') {
      _showwinDialog(context, displayEndx[0]);
    } else if ((displayEndx[3] == displayEndx[4] &&
            displayEndx[3] == displayEndx[5]) &&
        displayEndx[3] != '') {
      _showwinDialog(context, displayEndx[3]);
    } else if ((displayEndx[6] == displayEndx[7] &&
            displayEndx[6] == displayEndx[8]) &&
        displayEndx[6] != '') {
      _showwinDialog(context, displayEndx[6]);
    } else if ((displayEndx[0] == displayEndx[4] &&
            displayEndx[0] == displayEndx[8]) &&
        displayEndx[0] != '') {
      _showwinDialog(context, displayEndx[0]);
    } else if ((displayEndx[0] == displayEndx[3] &&
            displayEndx[0] == displayEndx[6]) &&
        displayEndx[0] != '') {
      _showwinDialog(context, displayEndx[0]);
    } else if ((displayEndx[1] == displayEndx[4] &&
            displayEndx[1] == displayEndx[7]) &&
        displayEndx[1] != '') {
      _showwinDialog(context, displayEndx[1]);
    } else if ((displayEndx[2] == displayEndx[4] &&
            displayEndx[2] == displayEndx[6]) &&
        displayEndx[2] != '') {
      _showwinDialog(context, displayEndx[2]);
    } else if ((displayEndx[2] == displayEndx[5] &&
            displayEndx[2] == displayEndx[8]) &&
        displayEndx[2] != '') {
      _showwinDialog(context, displayEndx[2]);
    }

    // Check for draw condition
    int fillbox = displayEndx.where((element) => element != '').length;

    if (fillbox == 9) {
      _showdrawDialog(
          context); // Show draw dialog if all boxes are filled and no winner
    }
  }
}
