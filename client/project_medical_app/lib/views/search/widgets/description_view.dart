import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DescriptionView extends StatelessWidget {
  final String description;

  const DescriptionView(this.description, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return (description == null)
        ? _loadingMarkdownWidget(context)
        : Markdown(
            data: description,
            shrinkWrap: true,
          );
  }

  Widget _loadingMarkdownWidget(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: SpinKitPulse(
        color: Theme.of(context).accentColor,
        size: 24,
      ),
    );
  }
}
