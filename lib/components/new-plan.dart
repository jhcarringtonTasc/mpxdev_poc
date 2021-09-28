import 'package:flutter/material.dart';
import '../data.dart';

class NewPlan extends StatefulWidget {
  const NewPlan({Key? key, required this.title, required this.dataGenerator})
      : super(key: key);

  final String title;
  final DataGenerator dataGenerator;

  @override
  _NewPlanState createState() =>
      _NewPlanState(dataGenerator: this.dataGenerator);
}

class _NewPlanState extends State<NewPlan> {
  _NewPlanState({required this.dataGenerator});
  List<Plan> planList = [];

  final DataGenerator dataGenerator;
  final _formKey = GlobalKey<FormState>();
  final nameInputController = TextEditingController();
  final descriptionInputController = TextEditingController();

  @override
  void initState() {
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
        child: Scaffold(
          body: Center(
            child: Column(children: [
              getForm(context, _formKey, this.nameInputController,
                  this.descriptionInputController),
              TextButton(
                  onPressed: () {
                    this.dataGenerator.addPlan(this.nameInputController.text,
                        this.descriptionInputController.text);
                    Navigator.pop(context);
                  },
                  child: Container(
                      color: Theme.of(context).primaryColor,
                      padding: EdgeInsets.all(8),
                      // width: Ed,
                      child: Center(
                          child: Text('Submit',
                              style: TextStyle(
                                  color: Theme.of(context).accentColor)))))
            ]),
          ),
        ));
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
