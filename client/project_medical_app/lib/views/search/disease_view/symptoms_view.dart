import 'package:flutter/material.dart';
import 'package:project_medical_app/logic/models/symptom.dart';
import 'package:project_medical_app/views/search/widgets/tabbed_list.dart';

class SymptomsView extends TabbedList<Symptom> {
  SymptomsView(List<Symptom> items) : super(items);

  @override
  Widget buildItems(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (_, index) {
        Symptom symptom = items[index];
        return ListTile(title: Text(symptom.name));
      },
    );
  }
}
