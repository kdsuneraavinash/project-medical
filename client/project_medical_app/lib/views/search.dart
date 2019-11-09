import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_medical_app/routes/router.dart';
import 'package:project_medical_app/utils/cached_image.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _controller;

  _SearchScreenState() {
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Center(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: screenSize.height * 0.1),
          CachedImage(
            imageUrl:
                "https://images.vexels.com/media/users/3/132066/isolated/preview/71646d7673e8847ab07b3b7e78928777-search-circle-icon-by-vexels.png",
            height: screenSize.height * 0.3,
            fit: BoxFit.contain,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Theme(
              data: Theme.of(context)
                  .copyWith(primaryColor: Theme.of(context).accentColor),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Search",
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  child: Text("Search"),
                  onPressed: () {
                    AppRouter.navigate(context, '/search/${_controller.text}');
                  },
                  color: Theme.of(context).accentColor,
                  textColor: Theme.of(context).primaryColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  child: Text("Clear"),
                  onPressed: () => _controller.clear(),
                  color: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).accentColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
