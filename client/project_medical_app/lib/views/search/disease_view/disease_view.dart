import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:project_medical_app/logic/api_interactor.dart';
import 'package:project_medical_app/logic/models/disease.dart';
import 'package:project_medical_app/logic/models/medicine.dart';
import 'package:project_medical_app/logic/models/symptom.dart';
import 'package:project_medical_app/logic/stack_manager.dart';
import 'package:project_medical_app/utils/cached_image.dart';
import 'package:provider/provider.dart';

import '../widgets/description_view.dart';
import 'medicines_view.dart';
import 'symptoms_view.dart';

class DiseaseView extends StatefulWidget {
  final String id;

  const DiseaseView({Key key, this.id}) : super(key: key);

  @override
  _DiseaseViewState createState() => _DiseaseViewState();
}

class _DiseaseViewState extends State<DiseaseView> {
  Disease _disease;
  List<Symptom> _symptoms;
  List<Medicine> _medicines;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          _disease = Provider.of<StackManager>(context).popObject() as Disease;
        });
        Provider.of<ApiInteractor>(context)
            .getDisease(widget.id)
            .then((disease) {
          if (mounted) {
            setState(() {
              _disease = disease;
            });
          }
        });
        Provider.of<ApiInteractor>(context)
            .getSuggestions(widget.id)
            .then((symptoms) {
          if (mounted) {
            setState(() {
              _symptoms = symptoms;
            });
          }
        });
        Provider.of<ApiInteractor>(context)
            .getTreatments(widget.id)
            .then((medicines) {
          if (mounted) {
            setState(() {
              _medicines = medicines;
            });
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (_disease == null)
          ? _loadingWidget()
          : DefaultTabController(
              length: 3,
              initialIndex: 0,
              child: NestedScrollView(
                headerSliverBuilder: (_, __) => [_headerSliverWidget()],
                body: TabBarView(
                  children: [
                    DescriptionView(_disease?.description),
                    SymptomsView(_symptoms),
                    MedicinesView(_medicines),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _headerSliverWidget() {
    Color primaryColor = Theme.of(context).primaryColor;

    return SliverAppBar(
      title: Text(_disease.name),
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
              tag: Key(widget.id),
              child: CachedImage(
                imageUrl: _disease.imageUrl,
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

  Widget _loadingWidget() {
    return Center(
      child: SpinKitWave(
        color: Theme.of(context).accentColor,
        size: 24,
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
