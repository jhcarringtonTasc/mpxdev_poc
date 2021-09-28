import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../data.dart';

class ListViewMain extends StatefulWidget {
  const ListViewMain(
      {Key? key, required this.title, required this.data, this.onTap})
      : super(key: key);

  final String title;
  final List<Plan> data;
  final Function(int)? onTap;

  @override
  _ListViewMainState createState() =>
      _ListViewMainState(planList: this.data, onTap: this.onTap);
}

class _ListViewMainState extends State<ListViewMain> {
  _ListViewMainState({required this.planList, this.onTap});
  List<Plan> planList = [];
  final Function(int)? onTap;
  // this.onTap = (int index) {};

  @override
  void initState() {
    // planList = this.data
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: getBody(this.planList, this.onTap),
      ),
    );
  }
}

Widget getBody(List<Plan> plans, Function(int)? onTap) {
  var listView = ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      itemCount: plans.length,
      itemBuilder: (BuildContext context, int index) {
        var children = [
          Text('Name: ${plans[index].name}'),
          Text('Description: ${plans[index].description}')
        ];

        return GestureDetector(
          child: Container(
            // height: 50,
            color: Theme.of(context).accentColor,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(bottom: 10),
            child: Center(
                child: Column(
              children: children,
            )),
          ),
          onTap: () {
            if (onTap != null) {
              onTap(index);
            }
          },
        );
      });
  return listView;
}
