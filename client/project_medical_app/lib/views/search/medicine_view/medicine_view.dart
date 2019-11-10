import 'package:flutter/material.dart';
import 'package:project_medical_app/logic/api_interactor.dart';
import 'package:project_medical_app/logic/models/medicine.dart';
import 'package:project_medical_app/logic/models/pharmacy.dart';
import 'package:project_medical_app/utils/cached_image.dart';
import 'package:project_medical_app/views/search/widgets/future_builder.dart';
import 'package:provider/provider.dart';

import '../widgets/description_view.dart';
import 'pharmacies_view.dart';

class MedicineView extends StatelessWidget {
  final Medicine medicine;

  const MedicineView({Key key, this.medicine}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: NestedScrollView(
          headerSliverBuilder: (_, __) => [_headerSliverWidget(context)],
          body: TabBarView(
            children: [
              HandledFutureBuilder<Medicine>(
                future: Provider.of<ApiInteractor>(context)
                    .getMedicine(medicine.id),
                builder: (_, medicine) => DescriptionView(medicine.description),
              ),
              HandledFutureBuilder<List<Pharmacy>>(
                future: Provider.of<ApiInteractor>(context)
                    .getSellingPharmacies(medicine.id),
                builder: (_, pharmacies) =>
                    PharmaciesView(pharmacies: pharmacies),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerSliverWidget(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;

    return SliverAppBar(
      title: Text(medicine.name),
      bottom: TabBar(
        tabs: [
          Tab(child: Text("Description")),
          Tab(child: Text("Pharmacies")),
        ],
      ),
      expandedHeight: MediaQuery.of(context).size.height * 0.35,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Hero(
              tag: Key(medicine.id),
              child: CachedImage(
                imageUrl: medicine.imageUrl,
                height: MediaQuery.of(context).size.height * 0.2,
              ),
            ),
            _bottomToTopLinearGradientDecoration(
                colors: [primaryColor, Colors.transparent])
          ],
        ),
        collapseMode: CollapseMode.parallax,
      ),
    );
  }

  Widget _bottomToTopLinearGradientDecoration(
      {List<Color> colors, double width, double height}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
    );
  }
}
