import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mpxdev_poc/data.dart';
import 'package:mpxdev_poc/screens/add-plan.dart';
import 'package:mpxdev_poc/widgets/bottomNavigator.dart';
import '../components/list-view-main.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.dataGenerator})
      : super(key: key);

  final String title;
  final DataGenerator dataGenerator;

  @override
  _MyHomePageState createState() => _MyHomePageState(
      data: this.dataGenerator.getAllPlans(),
      dataGenerator: this.dataGenerator);
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState({required this.data, required this.dataGenerator});
  final List<Plan> data;
  final DataGenerator dataGenerator;
  var focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: ListViewMain(
            title: 'a',
            data: this.data,
          ),
        ),
        bottomNavigationBar: MPXBottomAppBar(
            selectedPage: 'home',
            dataGenerator: this.dataGenerator,
            onGoBack: () => {this.setState(() {})}));
  }
}
