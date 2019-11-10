import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CachedImage extends StatefulWidget {
  final String imageUrl;
  final double height;
  final double width;
  final BoxFit fit;

  const CachedImage({
    Key key,
    @required this.imageUrl,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  _CachedImageState createState() => _CachedImageState();
}

class _CachedImageState extends State<CachedImage> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: this.widget.imageUrl,
      fit: this.widget.fit,
      height: this.widget.height,
      width: this.widget.width,
      placeholder: (_, __) => Container(
        width: this.widget.width,
        height: this.widget.height,
        alignment: Alignment.center,
        child: SpinKitThreeBounce(
          size: 24,
          color: Theme.of(context).accentColor,
        ),
      ),
      errorWidget: (_, __, error) => Container(
        width: this.widget.width,
        height: this.widget.height,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.error_outline),
              onPressed: () {
                setState(() {});
              },
            ),
            Text(
              "Error",
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
