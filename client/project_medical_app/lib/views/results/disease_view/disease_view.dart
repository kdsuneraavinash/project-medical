import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:project_medical_app/logic/api_interactor.dart';
import 'package:project_medical_app/logic/models/disease.dart';
import 'package:project_medical_app/logic/stack_manager.dart';
import 'package:project_medical_app/utils/cached_image.dart';
import 'package:provider/provider.dart';

import 'markdown_description.dart';

class DiseaseView extends StatefulWidget {
  final String id;

  const DiseaseView({Key key, this.id}) : super(key: key);

  @override
  _DiseaseViewState createState() => _DiseaseViewState();
}

class _DiseaseViewState extends State<DiseaseView> {
  Disease _disease;

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
                    MarddownDescription(
                      description: _disease?.description,
                    ),
                    Container(),
                    Container(),
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
