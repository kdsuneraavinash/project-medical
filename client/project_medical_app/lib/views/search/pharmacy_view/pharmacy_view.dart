import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:project_medical_app/logic/api_interactor.dart';
import 'package:project_medical_app/logic/config.dart';
import 'package:project_medical_app/logic/models/pharmacy.dart';
import 'package:project_medical_app/views/search/widgets/future_builder.dart';
import 'package:provider/provider.dart';
import 'package:latlong/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/description_view.dart';

class PharmacyView extends StatelessWidget {
  final Pharmacy pharmacy;

  PharmacyView({Key key, this.pharmacy}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pharmacy.name),
        centerTitle: true,
      ),
      body: HandledFutureBuilder<Pharmacy>(
        future: Provider.of<ApiInteractor>(context).getPharmacy(pharmacy.id),
        builder: (_, pharmacy) => ListView(
          children: <Widget>[
            new FlutterStaticMap(
                location: LatLng(pharmacy.latitude, pharmacy.longitude)),
            _buildListTile(
                MdiIcons.map, "View directions", "Open in Google Maps", context,
                callback: () => _launchURL("http://maps.google.com/maps"
                    "?daddr=${pharmacy.latitude},${pharmacy.longitude}&amp;ll=")),
            _buildListTile(MdiIcons.city, pharmacy.address, "Address", context),
            _buildListTile(
                MdiIcons.phone, pharmacy.phoneNumber, "Phone Number", context,
                callback: () => _launchURL("tel:${pharmacy.phoneNumber}")),
            DescriptionView(
              pharmacy.description,
              isScrollable: false,
            ),
          ],
        ),
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

class FlutterStaticMap extends StatelessWidget {
  const FlutterStaticMap({
    Key key,
    this.location,
  })  : accessToken = Config.accessToken,
        super(key: key);

  final String accessToken;
  final LatLng location;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
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
    );
  }
}
