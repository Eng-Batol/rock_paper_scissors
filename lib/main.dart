import 'package:flutter/material.dart';
import 'dart:math'; // Import to generate random numbers

Color customColor = Colors.pink.shade100;
Color customColorPerpeal = Color(0xFF7c7ded);

void main() {
  runApp(const MainApp());
}

// Convert MainApp to StatefulWidget to manage dynamic state
class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // Variables to hold the current move of each player
  String player1Move = 'rock'; // Default value
  String player2Move = 'scissors'; // Default value
  String winner = ""; // To hold the winner result

  // List of available signs (rock, paper, scissors)
  List<String> signs = ['rock', 'paper', 'scissors'];

  // Function to play the game by generating random moves for both players
  void play() {
    int randomPlayer1 = Random().nextInt(3); // Random number between 0 and 2
    int randomPlayer2 = Random().nextInt(3); // Random number between 0 and 2

    setState(() {
      player1Move = signs[randomPlayer1]; // Assign random move to Player 1
      player2Move = signs[randomPlayer2]; // Assign random move to Player 2
      determineWinner(); // Determine who wins based on the moves
    });
  }

  // Function to determine the winner
  void determineWinner() {
    if (player1Move == player2Move) {
      winner = "It's a draw!";
    } else if ((player1Move == 'rock' && player2Move == 'scissors') ||
        (player1Move == 'paper' && player2Move == 'rock') ||
        (player1Move == 'scissors' && player2Move == 'paper')) {
      winner = "Player 1 wins!";
    } else {
      winner = "Player 2 wins!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: customColor,
          title: Text(
            "Rock Paper Scissors",
            style: TextStyle(
                color: customColorPerpeal,
                fontSize: 28,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Choose Your Move",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: customColorPerpeal,
                ),
              ),
            ),
            SizedBox(height: 20),

            // Row to display player 1 and player 2 moves
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text("Player 1", style: TextStyle(fontSize: 20)),
                    // Use string interpolation to display the correct image for Player 1
                    Image.asset('assets/images/$player1Move.png', height: 100),
                  ],
                ),
                Column(
                  children: [
                    Text("Player 2", style: TextStyle(fontSize: 20)),
                    // Use string interpolation to display the correct image for Player 2
                    Image.asset('assets/images/$player2Move.png', height: 100),
                  ],
                ),
              ],
            ),

            SizedBox(height: 20),

            // Display the winner
            Text(
              winner,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: customColorPerpeal,
              ),
            ),

            SizedBox(height: 20),

            // Play button to trigger the play function
            ElevatedButton(
              onPressed: play,
              style: ElevatedButton.styleFrom(
                backgroundColor: customColor,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              child: Text("Play"),
            ),
          ],
        ),
      ),
    );
  }
}
