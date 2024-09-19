Tic-Tac-Toe Game
Overview
This is a Tic-Tac-Toe Game developed using Flutter. The classic game allows two players to compete against each other, with a scoring system that awards points to the winner of each game. The game also handles draws and displays an appropriate message when the game ends in a tie. The app features an intuitive interface and keeps track of the score for both players.

Features:
Two-Player Mode: Play against another player on the same device.
Score Tracking: Keeps track of points for Player X and Player O.
Draw Handling: Displays a "Draw" message if the game ends without a winner.
Game Reset: Resets the game board and scores for new rounds.
User-Friendly Interface: Simple and engaging design for easy gameplay.
Screenshots
![tictacctoe_1](https://github.com/user-attachments/assets/ba38f93b-c6c8-47aa-a7b8-0f89d7e6f8e4)   ![Tictactoe_2](https://github.com/user-attachments/assets/de198227-a554-4495-8693-2471a21d0a74)



How the Game Works
The Tic-Tac-Toe game follows classic rules and adds a scoring system with draw handling. Here’s a breakdown of its functionality:

Gameplay:

Players take turns placing their mark (X or O) on a 3x3 grid.
The first player to align three of their marks horizontally, vertically, or diagonally wins the game.
Score Tracking:

When Player X wins, 1 point is added to Player X’s score.
When Player O wins, 1 point is added to Player O’s score.
The current score for each player is displayed on the screen.
Draw Handling:

If all cells in the grid are filled and there is no winner, the game ends in a draw.
A "Draw" message is displayed, indicating that the game has concluded without a winner.
Game Reset:

After a win, draw, or the end of a game, the board is reset for a new round.
Scores are maintained across rounds until the app is closed.
User Interface:

The game features a clean and interactive board.
Players can easily see their moves, the current score, and if the game ends in a draw.
Project Structure
lib/main.dart: Contains the main logic for the Tic-Tac-Toe game, including game state management and score tracking.
lib/screens/: Includes the UI page for the game.
lib/Logic/gamelogic.dart: Handles utility functions related to game logic, including draw detection and score management.
