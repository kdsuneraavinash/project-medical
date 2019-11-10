import 'package:flutter/material.dart';
import 'package:project_medical_app/logic/models/symptom.dart';

class SymptomsView extends StatelessWidget {
  final List<Symptom> symptoms;

  SymptomsView(this.symptoms);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: symptoms.length,
      itemBuilder: (_, index) {
        Symptom symptom = symptoms[index];
        return ListTile(title: Text(symptom.name));
      },
    );
  }
}
