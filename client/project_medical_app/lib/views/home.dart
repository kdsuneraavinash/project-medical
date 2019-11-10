import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:project_medical_app/views/search.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'drawer/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Project Medical"),
        centerTitle: true,
      ),
      body: SearchScreen(),
      drawer: _buildDrawer(),
    );
  }

  Widget _buildDrawer() {
    return Builder(
      builder: (context) => MainDrawer(
        children: <Widget>[
          _buildDrawerListTile("Change Theme", MdiIcons.brush,
              () => _handleThemeChanged(context)),
          _buildDrawerListTile("API Documentation", MdiIcons.api,
              () => _launchURL("https://project-medical.herokuapp.com")),
          _buildDrawerListTile("About Project Medical", MdiIcons.developerBoard,
              () => _handleAboutPressed(context)),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  Widget _buildDrawerListTile(String title, IconData icon,
      [VoidCallback onPressed]) {
    return DrawerListTile(
      title: title,
      icon: icon,
      onPressed: onPressed ?? () {},
    );
  }

  void _handleThemeChanged(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => ThemeConsumer(
        child: ThemeDialog(),
      ),
    );
  }

  void _handleAboutPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ThemeConsumer(
          child: AboutDialog(
            applicationName: "Project Medical",
            applicationVersion: "v0.0.2",
            applicationIcon:
                Image.asset("assets/logo.png", width: 48, height: 48),
            children: [
              Text("A medical search engine"),
              Text(
                "By teampulse",
                style: Theme.of(context)
                    .textTheme
                    .body1
                    .copyWith(color: Theme.of(context).textTheme.caption.color),
              ),
            ],
          ),
        );
      },
    );
  }
}
