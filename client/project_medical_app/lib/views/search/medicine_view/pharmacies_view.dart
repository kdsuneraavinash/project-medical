import 'package:flutter/material.dart';
import 'package:project_medical_app/logic/models/pharmacy.dart';
import 'package:project_medical_app/utils/cached_image.dart';
import 'package:project_medical_app/views/search/widgets/tabbed_list.dart';

class PharmaciesView extends TabbedList<Pharmacy> {
  PharmaciesView(List<Pharmacy> items) : super(items);

  @override
  Widget buildItems(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: items.length,
      itemBuilder: (_, index) {
        return _buildGridTile(items[index]);
      },
    );
  }

  Widget _buildGridTile(Pharmacy pharmacy) {
    return Card(
      child: Material(
        child: InkWell(
          child: GridTile(
            child: CachedImage(
              imageUrl: pharmacy.imageUrl,
            ),
            footer: Container(
              height: 36.0,
              color: Colors.black87,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  pharmacy.name,
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
