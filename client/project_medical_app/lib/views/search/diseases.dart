import 'package:flutter/material.dart';
import 'package:project_medical_app/logic/api_interactor.dart';
import 'package:project_medical_app/logic/models/disease.dart';
import 'package:project_medical_app/routes/router.dart';
import 'package:project_medical_app/utils/cached_image.dart';
import 'package:project_medical_app/views/search/disease_view/disease_view.dart';
import 'package:project_medical_app/views/search/widgets/future_builder.dart';
import 'package:provider/provider.dart';

import 'disease_tile.dart';

class DiseasesListView extends StatelessWidget {
  final String search;

  const DiseasesListView({Key key, this.search}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search results: $search"),
        centerTitle: true,
      ),
      body: HandledFutureBuilder<List<Disease>>(
        future: Provider.of<ApiInteractor>(context).searchDiseases(search),
        emptyWidget: _noResultsWidget(context),
        builder: (context, result) {
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: result.length,
            itemBuilder: (_, index) => InkWell(
              onTap: () {
                AppRouter.directNavigate(
                  context,
                  (_) => DiseaseView(disease: result[index]),
                );
              },
              child: DiseaseTile(disease: result[index]),
            ),
          );
        },
      ),
    );
  }

  Widget _noResultsWidget(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CachedImage(
            imageUrl:
                "https://cdn4.iconfinder.com/data/icons/computer-emoticons/512/Sad-Emoji-Emotion-Face-Expression-Feeling_1-512.png",
            width: 150,
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Sorry... No results found.",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              child: Text("Go Back"),
              onPressed: () => Navigator.pop(context),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).accentColor,
            ),
          ),
        ],
      ),
    );
  }
}
