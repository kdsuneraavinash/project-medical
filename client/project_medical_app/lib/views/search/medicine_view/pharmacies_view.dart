import 'package:flutter/material.dart';
import 'package:project_medical_app/logic/models/pharmacy.dart';
import 'package:project_medical_app/logic/stack_manager.dart';
import 'package:project_medical_app/routes/router.dart';
import 'package:project_medical_app/utils/cached_image.dart';
import 'package:provider/provider.dart';

class PharmaciesView extends StatelessWidget {
  final List<Pharmacy> pharmacies;

  const PharmaciesView({Key key, this.pharmacies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: pharmacies.length,
      itemBuilder: (_, index) {
        return PharmacyTile(context: context, pharmacy: pharmacies[index]);
      },
    );
  }
}

class PharmacyTile extends StatelessWidget {
  const PharmacyTile({
    Key key,
    @required this.context,
    @required this.pharmacy,
  }) : super(key: key);

  final BuildContext context;
  final Pharmacy pharmacy;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Material(
        child: InkWell(
          onTap: () {
            Provider.of<StackManager>(context).storeObject(pharmacy);
            AppRouter.navigate(context, '/pharmacy/${pharmacy.id}');
          },
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
