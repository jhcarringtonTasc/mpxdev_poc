import 'package:flutter/material.dart';
import 'package:mpxdev_poc/components/list-view-main.dart';
import 'package:mpxdev_poc/components/modify-plan.dart';
import 'package:mpxdev_poc/data.dart';
import 'package:mpxdev_poc/widgets/bottomNavigator.dart';

class EditPlanPage extends StatefulWidget {
  const EditPlanPage(
      {Key? key, required this.title, required this.dataGenerator})
      : super(key: key);

  final String title;
  final DataGenerator dataGenerator;

  @override
  _EditPlanPageState createState() => _EditPlanPageState(
      data: this.dataGenerator.getAllPlans(),
      dataGenerator: this.dataGenerator);
}

class _EditPlanPageState extends State<EditPlanPage> {
  _EditPlanPageState({required this.data, required this.dataGenerator});
  final List<Plan> data;
  final DataGenerator dataGenerator;
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    print("INIT");
    this.selectedIndex = -1;
  }

  @override
  Widget build(BuildContext context) {
    var onUpdate = (int index) {
      this.selectedIndex = index;
      this.setState(() {});
    };
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            // constraints: BoxConstraints.expand(),
            child: SingleChildScrollView(
                child: Flex(
              direction: Axis.vertical,
              children: getBody(
                  context, data, dataGenerator, this.selectedIndex, onUpdate),
            ))),
        bottomNavigationBar: MPXBottomAppBar(
            selectedPage: 'edit-plans',
            dataGenerator: this.dataGenerator,
            onGoBack: () => {})
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

List<Widget> getBody(BuildContext context, List<Plan> data,
    DataGenerator dataGenerator, int selectedIndex, Function(int) onUpdate) {
  var listWidget = [
    Container(
        padding: EdgeInsets.all(20),
        child: Text(
          'Select an item from the plan list',
          style: TextStyle(fontSize: 20),
        )),
    Container(
      height: MediaQuery.of(context).size.height -
          AppBar().preferredSize.height -
          200,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Center(
          child: ListViewMain(
        title: 'a',
        data: data,
        onTap: (index) {
          onUpdate(index);
        },
      )),
    )
  ];

  if (selectedIndex == -1) {
    return listWidget;
  } else {
    return [
      ModifyPlan(
          plan: data[selectedIndex],
          planIndex: selectedIndex,
          dataGenerator: dataGenerator)
    ];
  }
}
