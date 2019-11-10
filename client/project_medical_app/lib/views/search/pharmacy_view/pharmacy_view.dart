import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:project_medical_app/logic/api_interactor.dart';
import 'package:project_medical_app/logic/models/pharmacy.dart';
import 'package:project_medical_app/logic/stack_manager.dart';
import 'package:project_medical_app/utils/cached_image.dart';
import 'package:provider/provider.dart';
import 'package:latlong/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/description_view.dart';

class PharmacyView extends StatefulWidget {
  final String id;

  const PharmacyView({Key key, this.id}) : super(key: key);

  @override
  _PharmacyViewState createState() => _PharmacyViewState();
}

class _PharmacyViewState extends State<PharmacyView> {
  final String accessToken =
      "pk.eyJ1Ijoia2RzdW5lcmFhdmluYXNoIiwiYSI6ImNrMnNhOWlwMzB5a3Izb252MDFpNHIxcTYifQ.L_Bup64BzmXWrUSgTm7cBQ";
  Pharmacy _pharmacy;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          _pharmacy =
              Provider.of<StackManager>(context).popObject() as Pharmacy;
        });
        Provider.of<ApiInteractor>(context)
            .getPharmacy(widget.id)
            .then((pharmacy) {
          if (mounted) {
            setState(() {
              _pharmacy = pharmacy;
            });
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final location = (_pharmacy?.description == null)
        ? null
        : LatLng(_pharmacy.latitude, _pharmacy.longitude);

    return Scaffold(
      appBar: AppBar(
        title: Text((_pharmacy == null) ? "Pharmacy Details" : _pharmacy.name),
        centerTitle: true,
      ),
      body: (_pharmacy == null)
          ? Container()
          : ListView(
              children: <Widget>[
                CachedImage(
                  imageUrl: _pharmacy.imageUrl,
                ),
                _buildListTile(
                    MdiIcons.city, _pharmacy.address, "Address", context),
                _buildListTile(MdiIcons.phone, _pharmacy.phoneNumber,
                    "Phone Number", context,
                    callback: () => _launchURL("tel:${_pharmacy.phoneNumber}")),
                if (location != null) ...[
                  _buildListTile(MdiIcons.map, "View directions",
                      "Open in Google Maps", context,
                      callback: () => _launchURL("http://maps.google.com/maps"
                          "?daddr=${location.latitude},${location.longitude}&amp;ll=")),
                  IgnorePointer(
                    ignoring: true,
                    child: SizedBox(
                      height: 400,
                      child: FlutterMap(
                        options: MapOptions(
                          center: location,
                          zoom: 13.0,
                        ),
                        layers: [
                          TileLayerOptions(
                            urlTemplate: "https://api.tiles.mapbox.com/v4/"
                                "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
                            additionalOptions: {
                              'accessToken': '$accessToken',
                              'id': 'mapbox.streets',
                            },
                          ),
                          MarkerLayerOptions(
                            markers: [
                              Marker(
                                width: 80.0,
                                height: 80.0,
                                point: location,
                                builder: (ctx) => Container(
                                  child: Icon(
                                    MdiIcons.mapMarker,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                DescriptionView(
                  _pharmacy?.description,
                  isScrollable: false,
                ),
              ],
            ),
    );
  }

  Widget _buildListTile(
      IconData icon, String title, String subtitle, BuildContext context,
      {VoidCallback callback}) {
    return ListTile(
        leading: Icon(icon, color: Theme.of(context).accentColor),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        onTap: callback,
        subtitle: Text(subtitle),
        trailing: callback != null ? Icon(MdiIcons.chevronRight) : null);
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }
}
