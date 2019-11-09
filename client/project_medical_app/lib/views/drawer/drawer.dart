import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  final List<Widget> children;

  MainDrawer({
    Key key,
    this.children = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Text(
                  "Menu",
                  style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).accentColor),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: children.length,
                itemBuilder: (_, index) => children[index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final IconData icon;

  const DrawerListTile({
    Key key,
    @required this.title,
    this.onPressed,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: Icon(icon, color: Theme.of(context).accentColor),
      title: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
      ),
      onTap: onPressed != null
          ? () {
              if (Scaffold.of(context).isDrawerOpen) {
                Navigator.pop(context);
              }
              onPressed();
            }
          : null,
    );
  }
}
