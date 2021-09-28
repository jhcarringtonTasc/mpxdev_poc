// Flutter code sample for BottomAppBar
//
// This example shows the [BottomAppBar], which can be configured to have a notch using the
// [BottomAppBar.shape] property. This also includes an optional [FloatingActionButton], which illustrates
// the [FloatingActionButtonLocation]s in relation to the [BottomAppBar].

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mpxdev_poc/screens/add-plan.dart';
import 'package:mpxdev_poc/screens/edit-plan.dart';
import 'package:mpxdev_poc/screens/home.dart';

import '../data.dart';

class MPXBottomAppBar extends StatelessWidget {
  MPXBottomAppBar({
    required this.onGoBack,
    required this.dataGenerator,
    required this.selectedPage,
    this.fabLocation = FloatingActionButtonLocation.endDocked,
    this.shape = const CircularNotchedRectangle(),
  });

  final DataGenerator dataGenerator;
  final FloatingActionButtonLocation fabLocation;
  final NotchedShape? shape;
  final String selectedPage;

  final VoidCallback onGoBack;
  FutureOr<dynamic> Function(dynamic) _onGoBack = (dynamic value) {};

  static final List<FloatingActionButtonLocation> centerLocations =
      <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  @override
  Widget build(BuildContext context) {
    this._onGoBack = (dynamic value) {
      this.onGoBack();
    };
    return BottomAppBar(
      color: Theme.of(context).primaryColor,
      child: Container(
          height: 50,
          child: IconTheme(
            data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        color:
                            selectedPage == 'edit-plans' ? Colors.grey : null,
                        child: IconButton(
                          tooltip: 'Edit',
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            if (selectedPage == 'edit-plans') {
                              return;
                            }
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditPlanPage(
                                            title: "Edit Plans",
                                            dataGenerator: this.dataGenerator)))
                                .then(this._onGoBack);
                          },
                        ))),
                Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        color: selectedPage == 'home' ? Colors.grey : null,
                        child: IconButton(
                          tooltip: 'Home',
                          icon: const Icon(
                            Icons.home,
                            size: 30,
                          ),
                          onPressed: () {
                            this._onGoBack(null);
                            if (Navigator.canPop(context)) {
                              Navigator.pop(context);
                            }
                          },
                        ))),
                Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        color: selectedPage == 'add-plans' ? Colors.grey : null,
                        child: IconButton(
                          tooltip: 'Add',
                          onPressed: () {
                            if (selectedPage == 'add-plans') {
                              return;
                            }
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddPlanPage(
                                            title: "Add Plan",
                                            dataGenerator: this.dataGenerator)))
                                .then(this._onGoBack);
                          },
                          icon: const Icon(Icons.add),
                        ))),
              ],
            ),
          )),
    );
  }
}
