import 'package:flutter/material.dart';
import 'package:project_medical_app/logic/models/medicine.dart';
import 'package:project_medical_app/routes/router.dart';
import 'package:project_medical_app/utils/cached_image.dart';
import 'package:project_medical_app/views/search/medicine_view/medicine_view.dart';

class MedicinesView extends StatelessWidget {
  final List<Medicine> medicines;

  MedicinesView(this.medicines);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: medicines.length,
      itemBuilder: (_, index) {
        return new MedicineTile(context: context, medicine: medicines[index]);
      },
    );
  }
}

class MedicineTile extends StatelessWidget {
  const MedicineTile({
    Key key,
    @required this.context,
    @required this.medicine,
  }) : super(key: key);

  final BuildContext context;
  final Medicine medicine;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Material(
        child: InkWell(
          onTap: () {
            AppRouter.directNavigate(
                context, (_) => MedicineView(medicine: medicine));
          },
          child: GridTile(
            child: Hero(
              tag: Key(medicine.id),
              child: CachedImage(
                imageUrl: medicine.imageUrl,
              ),
            ),
            footer: Container(
              height: 36.0,
              color: Colors.black87,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  medicine.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
