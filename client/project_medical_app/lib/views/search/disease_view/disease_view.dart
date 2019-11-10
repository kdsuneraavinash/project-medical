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

class DiseaseView extends StatefulWidget {
  final Disease disease;

  const DiseaseView({Key key, @required this.disease}) : super(key: key);

  @override
  _DiseaseViewState createState() => _DiseaseViewState();
}

class _DiseaseViewState extends State<DiseaseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: NestedScrollView(
          headerSliverBuilder: (_, __) => [_headerSliverWidget()],
          body: TabBarView(
            children: [
              HandledFutureBuilder<Disease>(
                future: Provider.of<ApiInteractor>(context)
                    .getDisease(widget.disease.id),
                builder: (_, disease) => DescriptionView(disease.description),
              ),
              HandledFutureBuilder<List<Symptom>>(
                future: Provider.of<ApiInteractor>(context)
                    .getSuggestions(widget.disease.id),
                builder: (_, _symptoms) => SymptomsView(_symptoms),
              ),
              HandledFutureBuilder<List<Medicine>>(
                future: Provider.of<ApiInteractor>(context)
                    .getTreatments(widget.disease.id),
                builder: (_, _medicines) => MedicinesView(_medicines),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerSliverWidget() {
    return SliverAppBar(
      title: Text(widget.disease.name),
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
              tag: Key(widget.disease.id),
              child: CachedImage(
                imageUrl: widget.disease.imageUrl,
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
