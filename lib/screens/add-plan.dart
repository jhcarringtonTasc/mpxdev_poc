import 'package:flutter/material.dart';
import 'package:mpxdev_poc/components/new-plan.dart';
import 'package:mpxdev_poc/data.dart';
import 'package:mpxdev_poc/widgets/bottomNavigator.dart';

class AddPlanPage extends StatefulWidget {
  const AddPlanPage(
      {Key? key, required this.title, required this.dataGenerator})
      : super(key: key);

  final String title;
  final DataGenerator dataGenerator;

  @override
  _AddPlanPageState createState() =>
      _AddPlanPageState(dataGenerator: this.dataGenerator);
}

class _AddPlanPageState extends State<AddPlanPage> {
  _AddPlanPageState({required this.dataGenerator});
  final DataGenerator dataGenerator;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: NewPlan(title: 'a', dataGenerator: this.dataGenerator),
        ),
        bottomNavigationBar: MPXBottomAppBar(
            selectedPage: 'add-plans',
            dataGenerator: this.dataGenerator,
            onGoBack: () => {})
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
