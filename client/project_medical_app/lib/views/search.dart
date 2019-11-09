import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return Center(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Image.network(
            "https://images.vexels.com/media/users/3/132066/isolated/preview/71646d7673e8847ab07b3b7e78928777-search-circle-icon-by-vexels.png",
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Theme(
              data: Theme.of(context)
                  .copyWith(primaryColor: Theme.of(context).accentColor),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(border: OutlineInputBorder()),
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
                    print(_controller.text);
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
