import 'package:flutter/material.dart';
import '../App/AppRoutes.dart';
import '../Base/WSC.dart';

class MainScreenController extends StateController {
  static int currentTheme = 0;
  void navigateToCard() => Navigator.push(
      context, AppRoutes.cardScreen());

  @override
  void init() {
  }

  @override
  void unload() {}
}

class MainScreen extends StatefulWidget {
  MainScreen({Key? key});

  @override
  State<MainScreen> createState() => MainScreenScreenState();
}

class MainScreenScreenState
    extends StateWithController<MainScreen, MainScreenController> {
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
        title: Text('Dark Mode'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                controller.navigateToCard();
              },
              child: const Text('Open Card Screen'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  MainScreenController createController() => MainScreenController();
}
