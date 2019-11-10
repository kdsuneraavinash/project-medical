import 'package:flutter/material.dart';
import 'package:project_medical_app/logic/api_interactor.dart';
import 'package:project_medical_app/logic/models/disease.dart';
import 'package:project_medical_app/logic/models/medicine.dart';
import 'package:project_medical_app/logic/models/symptom.dart';
import 'package:project_medical_app/utils/cached_image.dart';
import 'package:project_medical_app/views/search/widgets/future_builder.dart';
import 'package:provider/provider.dart';

import '../widgets/description_view.dart';
import 'medicines_view.dart';
import 'symptoms_view.dart';

class DiseaseView extends StatelessWidget {
  final Disease disease;
  const DiseaseView({Key key, @required this.disease}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: NestedScrollView(
          headerSliverBuilder: (_, __) => [_headerSliverWidget(context)],
          body: TabBarView(
            children: [
              HandledFutureBuilder<Disease>(
                future:
                    Provider.of<ApiInteractor>(context).getDisease(disease.id),
                builder: (_, disease) => DescriptionView(disease.description),
              ),
              HandledFutureBuilder<List<Symptom>>(
                future: Provider.of<ApiInteractor>(context)
                    .getSuggestions(disease.id),
                builder: (_, symptoms) => SymptomsView(symptoms),
              ),
              HandledFutureBuilder<List<Medicine>>(
                future: Provider.of<ApiInteractor>(context)
                    .getTreatments(disease.id),
                builder: (_, medicines) => MedicinesView(medicines),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerSliverWidget(BuildContext context) {
    return SliverAppBar(
      title: Text(disease.name),
      bottom: TabBar(
        tabs: [
          Tab(child: Text("Description")),
          Tab(child: Text("Symptoms")),
          Tab(child: Text("Medicines")),
        ],
      ),
      expandedHeight: MediaQuery.of(context).size.height * 0.35,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Hero(
              tag: Key(disease.id),
              child: CachedImage(
                imageUrl: disease.imageUrl,
                height: MediaQuery.of(context).size.height * 0.2,
              ),
            ),
            _bottomToTopLinearGradientDecoration(
                colors: [Theme.of(context).primaryColor, Colors.transparent])
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
