import 'package:flutter/material.dart';
import '../Base/WSC.dart';

class CardController extends StateController {
  static int currentTheme = 0;

  @override
  void init() {
    // Initialize your controller here if needed
  }

  @override
  void unload() {
    // Unload your controller here if needed
  }
}

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => CardScreenScreenState();
}

class CardScreenScreenState
    extends StateWithController<CardScreen, CardController> {
  @override
  void initState() {
    super.initState();
    print("object");
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Screen'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 10.0, // Spacing between columns
          mainAxisSpacing: 10.0, // Spacing between rows
        ),
        itemCount: 20, // Number of items in the grid
        itemBuilder: (context, index) {
          return Card(
            color: Colors.blue,
            child: Center(
              child: Text(
                'Item $index',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  CardController createController() => CardController();
}
