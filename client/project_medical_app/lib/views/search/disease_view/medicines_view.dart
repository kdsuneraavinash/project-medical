import 'package:flutter/material.dart';
import 'package:project_medical_app/logic/models/medicine.dart';
import 'package:project_medical_app/logic/stack_manager.dart';
import 'package:project_medical_app/routes/router.dart';
import 'package:project_medical_app/utils/cached_image.dart';
import 'package:project_medical_app/views/search/widgets/tabbed_list.dart';
import 'package:provider/provider.dart';

class MedicinesView extends TabbedList<Medicine> {
  MedicinesView(List<Medicine> items) : super(items);

  @override
  Widget buildItems(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: items.length,
      itemBuilder: (_, index) {
        return _buildGridTile(context, items[index]);
      },
    );
  }

  Widget _buildGridTile(BuildContext context, Medicine medicine) {
    return Card(
      child: Material(
        child: InkWell(
          onTap: () {
            Provider.of<StackManager>(context).storeObject(medicine);
            AppRouter.navigate(context, '/medicine/${medicine.id}');
          },
          child: GridTile(
            child: CachedImage(
              imageUrl: medicine.imageUrl,
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
