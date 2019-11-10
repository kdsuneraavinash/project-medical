import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:project_medical_app/utils/cached_image.dart';

abstract class TabbedList<T> extends StatelessWidget {
  @protected
  final List<T> items;

  const TabbedList(this.items, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (items == null)
        ? SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: SpinKitPulse(
              color: Theme.of(context).accentColor,
              size: 24,
            ),
          )
        : (items.length == 0)
            ? Center(
                child: CachedImage(
                  fit: BoxFit.contain,
                  width: 150,
                  height: 150,
                  imageUrl:
                      "https://cdn1.iconfinder.com/data/icons/web-notifications-1-1/64/11._list_is_empty_shopping_library_computer_papers_documents_cart-512.png",
                ),
              )
            : buildItems(context);
  }

  Widget buildItems(BuildContext context);
}
