import 'package:flutter/material.dart';
import '../data.dart';

class ModifyPlan extends StatefulWidget {
  const ModifyPlan(
      {Key? key,
      required this.plan,
      required this.planIndex,
      required this.dataGenerator})
      : super(key: key);

  final DataGenerator dataGenerator;
  final Plan plan;
  final int planIndex;

  @override
  _ModifyPlanState createState() => _ModifyPlanState(
      dataGenerator: this.dataGenerator,
      plan: this.plan,
      planIndex: this.planIndex);
}

class _ModifyPlanState extends State<ModifyPlan> {
  _ModifyPlanState(
      {required this.dataGenerator,
      required this.plan,
      required this.planIndex});
  List<Plan> planList = [];

  final DataGenerator dataGenerator;
  final Plan plan;
  final int planIndex;
  final _formKey = GlobalKey<FormState>();
  final nameInputController = TextEditingController();
  final descriptionInputController = TextEditingController();

  @override
  void initState() {
    nameInputController.value = TextEditingValue(text: plan.name);
    descriptionInputController.value = TextEditingValue(text: plan.description);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Center(
        child: Column(children: [
          getForm(context, _formKey, this.nameInputController,
              this.descriptionInputController),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    this.dataGenerator.deletePlan(this.planIndex);
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.delete, color: Colors.red))
            ],
          ),
          TextButton(
              onPressed: () {
                this.dataGenerator.updatePlan(this.nameInputController.text,
                    this.descriptionInputController.text, this.planIndex);
                Navigator.pop(context);
              },
              child: Container(
                  color: Theme.of(context).primaryColor,
                  padding: EdgeInsets.all(8),
                  // width: Ed,
                  child: Center(
                      child: Text('Save',
                          style: TextStyle(
                              color: Theme.of(context).accentColor)))))
        ]),
      ),
    );
  }
}

Widget getForm(
    BuildContext context,
    GlobalKey formKey,
    TextEditingController nameInputController,
    TextEditingController descriptionInputController) {
  return Form(
      key: formKey,
      child: Column(
        children: [
          formField(context, 'Name', nameInputController),
          formField(context, 'Description', descriptionInputController)
        ],
      ));
}

Widget formField(
    BuildContext context, String title, TextEditingController controller) {
  return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
      color: Theme.of(context).accentColor,
      child: Row(
        children: [
          Expanded(flex: 1, child: Center(child: Text(title + ':'))),
          Expanded(
              flex: 3,
              child: TextFormField(
                controller: controller,
              ))
        ],
      ));
}
