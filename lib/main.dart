import 'package:flutter/material.dart';
import 'package:mpxdev_poc/screens/add-plan.dart';
import 'package:mpxdev_poc/screens/edit-plan.dart';
import 'screens/home.dart';
import 'data.dart';

void main() {
  var app = MyApp();
  app.dataGenerator.setupScenario();
  runApp(app);
}

class MyApp extends StatelessWidget {
  final DataGenerator dataGenerator = new DataGenerator();
  final Map<int, Color> primaryColor = {
    50: Color.fromRGBO(80, 90, 137, 1),
    100: Color.fromRGBO(80, 90, 137, 1),
    200: Color.fromRGBO(80, 90, 137, 1),
    300: Color.fromRGBO(80, 90, 137, 1),
    400: Color.fromRGBO(80, 90, 137, 1),
    500: Color.fromRGBO(80, 90, 137, 1),
    600: Color.fromRGBO(80, 90, 137, 1),
    700: Color.fromRGBO(80, 90, 137, 1),
    800: Color.fromRGBO(80, 90, 137, 1),
    900: Color.fromRGBO(80, 90, 137, 1),
  };
  final Color accentColor = Color.fromRGBO(238, 227, 121, 1);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MPD Dev',
      theme: ThemeData(
          primarySwatch: MaterialColor(0xFF505A89, primaryColor),
          primaryColor: primaryColor[50],
          accentColor: accentColor),
      // home: MyHomePage(title: 'MPX', dataGenerator: dataGenerator),
      initialRoute: '/',
      routes: {
        '/': (context) =>
            MyHomePage(title: 'MPX Dev', dataGenerator: dataGenerator),
        '/addPlan': (context) =>
            AddPlanPage(title: 'Add Plan', dataGenerator: dataGenerator),
        '/editPlan': (context) =>
            EditPlanPage(title: 'Edit Plan', dataGenerator: dataGenerator)
      },
    );
  }
}
