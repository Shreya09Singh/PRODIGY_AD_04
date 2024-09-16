import 'package:flutter/material.dart';
import 'package:tictactoe_game/logic/gameIogic.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool isturn = true;

  List<String> displayEndx = ['', '', '', '', '', '', '', '', ''];

  late Gameiogic gameiogic;
  // String displayEndx = '';
  var filledbox = 0;

  int xwinner = 0;
  int owinner = 0;
  void _clearboard() {
    setState(() {
      for (int i = 0; i <= displayEndx.length - 1; i++) {
        displayEndx[i] = '';
      }
    });
    filledbox = 0;
  }

  void updateWinners(int xwins, int owins) {
    setState(() {
      xwinner = xwins;
      owinner = owins;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gameiogic = Gameiogic(
      updateWinners,
      displayEndx,
      xwinner,
      owinner,
      _clearboard,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            height: 150,
            // color: Colors.yellow,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isturn
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('PLAYER 0',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 23,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(
                                height: 7,
                              ),
                              Text(owinner.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 26,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      )
                    : Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('PLAYER 0',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(
                            height: 7,
                          ),
                          Text(owinner.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                SizedBox(
                  width: 30,
                ),
                !isturn
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('PLAYER X',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(
                                height: 7,
                              ),
                              Text(xwinner.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 27,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      )
                    : Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('PLAYER X',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(
                            height: 7,
                          ),
                          Text(xwinner.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        _tapped(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black,
                            )),
                        child: Center(
                          child: Text(
                            // index.toString(),
                            displayEndx[index].toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 50,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          Container(
            height: 47,
            width: 150,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(20)),
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
                ),
                onPressed: () {
                  _clearboard();
                },
                child: Text(
                  'reset game',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'TIC TAC TOE GAME',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (displayEndx[index] == '') {
        if (isturn) {
          displayEndx[index] = 'o'; // Set 'O'
        } else {
          displayEndx[index] = 'x'; // Set 'X'
        }

        // Increment filledbox only when a box is filled
        filledbox += 1;
        print(filledbox);

        isturn = !isturn;
        gameiogic.checkWinner(context);
        // Toggle the turn
      }
    });
  }
}
