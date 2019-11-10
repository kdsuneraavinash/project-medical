import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:project_medical_app/logic/api_interactor.dart';
import 'package:project_medical_app/logic/models/medicine.dart';
import 'package:project_medical_app/logic/models/pharmacy.dart';
import 'package:project_medical_app/logic/stack_manager.dart';
import 'package:project_medical_app/utils/cached_image.dart';
import 'package:provider/provider.dart';

import '../widgets/description_view.dart';
import 'pharmacies_view.dart';

class MedicineView extends StatefulWidget {
  final String id;

  const MedicineView({Key key, this.id}) : super(key: key);

  @override
  _MedicineViewState createState() => _MedicineViewState();
}

class _MedicineViewState extends State<MedicineView> {
  Medicine _medicine;
  List<Pharmacy> _pharmacies;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          _medicine =
              Provider.of<StackManager>(context).popObject() as Medicine;
        });
        Provider.of<ApiInteractor>(context)
            .getMedicine(widget.id)
            .then((medicine) {
          if (mounted) {
            setState(() {
              _medicine = medicine;
            });
          }
        });
        Provider.of<ApiInteractor>(context)
            .getSellingPharmacies(widget.id)
            .then((pharmacies) {
          if (mounted) {
            setState(() {
              _pharmacies = pharmacies;
            });
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (_medicine == null)
          ? Container()
          : DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: NestedScrollView(
                headerSliverBuilder: (_, __) => [_headerSliverWidget()],
                body: TabBarView(
                  children: [
                    DescriptionView(_medicine?.description),
                    PharmaciesView(_pharmacies),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _headerSliverWidget() {
    Color primaryColor = Theme.of(context).primaryColor;

    return SliverAppBar(
      title: Text(_medicine.name),
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
              tag: Key(widget.id),
              child: CachedImage(
                imageUrl: _medicine.imageUrl,
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
