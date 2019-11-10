import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:project_medical_app/logic/api_interactor.dart';
import 'package:project_medical_app/logic/models/disease.dart';
import 'package:project_medical_app/logic/stack_manager.dart';
import 'package:project_medical_app/routes/router.dart';
import 'package:project_medical_app/utils/cached_image.dart';
import 'package:project_medical_app/utils/helpers.dart';
import 'package:provider/provider.dart';

class DiseasesListView extends StatefulWidget {
  final String search;

  const DiseasesListView({Key key, this.search}) : super(key: key);

  @override
  _DiseasesListViewState createState() => _DiseasesListViewState();
}

class _DiseasesListViewState extends State<DiseasesListView> {
  List<Disease> _result;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((d) {
      Provider.of<ApiInteractor>(context)
          .searchDiseases(widget.search)
          .then((result) {
        if (mounted) {
          setState(() {
            _result = result;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search results for '${widget.search}'"),
        centerTitle: true,
      ),
      body: (_result == null)
          ? _loadingWidget()
          : (_result.length == 0)
              ? _noResultsWidget()
              : ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: _result.length,
                  itemBuilder: (_, index) => InkWell(
                    onTap: () {
                      Provider.of<StackManager>(context)
                          .storeObject(_result[index]);
                      AppRouter.navigate(
                          context, '/disease/${_result[index].id}');
                    },
                    child: _buildDiseaseTile(_result[index]),
                  ),
                ),
    );
  }

  Widget _loadingWidget() {
    return Center(
      child: SpinKitWave(
        color: Theme.of(context).accentColor,
        size: 24,
      ),
    );
  }

  Widget _noResultsWidget() {
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

  Widget _buildDiseaseTile(Disease disease) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              child: Hero(
                tag: Key(disease.id),
                child: CachedImage(
                  imageUrl: disease.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.width * 0.2,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  disease.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "${disease.snippet}...",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      Helpers.timeagoText(disease.timestamp, "en"),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
