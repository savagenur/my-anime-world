import 'package:flutter/material.dart';
import 'package:my_animes/models/detail_model.dart';
import 'package:my_animes/services/apis/detail_api.dart';
import 'package:my_animes/widgets/home_appbar.dart';

class DetailPage extends StatefulWidget {
  final String id;
  const DetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isExtend = false;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DetailApi().getDetail(widget.id),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          DetailModel data = snapshot.data;
          int maxStatisticNum = getMaxStatisticNum(data);
          return Scaffold(
            appBar: homeAppBar(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  buildTopPart(context, data),
                  Text(
                    data.title!,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  buildTypeEpMin(data),
                  buildGenres(data),
                  SizedBox(
                    height: 30,
                  ),
                  buildSynopsis(data),
                  SizedBox(
                    height: 20,
                  ),
                  buildListPictures(data),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      spacing: 50,
                      runSpacing: 10,
                      children: [
                        buildTitleData(
                            "Source",
                           data.source==null?'?': data.source![0].toUpperCase() +
                                data.source!.substring(1)),
                        buildTitleData(
                            "Season",
                            data.startSeason == null
                                ? "?"
                                : data.startSeason!.season!.toUpperCase() +
                                    ' ' +
                                    data.startSeason!.year!.toString()),
                        buildTitleData("Aired",data.startDate==null?'?': data.startDate!.toString()),
                        buildTitleData(
                            "Rating",
                            data.rating == null
                                ? "?"
                                : data.rating!.toUpperCase()),
                        buildTitleData(
                            data.relatedAnime == null ||
                                    data.relatedAnime!.isEmpty
                                ? "?"
                                : data.relatedAnime![0]
                                        .relationTypeFormatted!,
                          data.relatedAnime == null ||
                                    data.relatedAnime!.isEmpty
                                ? "?"
                                :  data.relatedAnime![0].node!.title! ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  buildRecommendations(data),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "Statistics:",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        buildStatisticItem(
                          context,
                          "Watching",
                          data.statistics!.status!.watching!,
                          double.parse(data.statistics!.status!.watching!),
                          maxStatisticNum,
                        ),
                        buildStatisticItem(
                          context,
                          "Completed",
                          data.statistics!.status!.completed!,
                          double.parse(data.statistics!.status!.completed!),
                          maxStatisticNum,
                        ),
                        buildStatisticItem(
                          context,
                          "On Hold",
                          data.statistics!.status!.onHold!,
                          double.parse(data.statistics!.status!.onHold!),
                          maxStatisticNum,
                        ),
                        buildStatisticItem(
                          context,
                          "Dropped",
                          data.statistics!.status!.dropped!,
                          double.parse(data.statistics!.status!.dropped!),
                          maxStatisticNum,
                        ),
                        buildStatisticItem(
                          context,
                          "Plan to Watch",
                          data.statistics!.status!.planToWatch!,
                          double.parse(data.statistics!.status!.planToWatch!),
                          maxStatisticNum,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    margin: EdgeInsets.only(right: 20),
                    child: Text(
                      "All members: " + data.numListUsers!.toString(),
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: homeAppBar(),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  int getMaxStatisticNum(DetailModel data) {
    List<int> items = [
      int.parse(data.statistics!.status!.watching!),
      int.parse(data.statistics!.status!.completed!),
      int.parse(data.statistics!.status!.onHold!),
      int.parse(data.statistics!.status!.dropped!),
      int.parse(data.statistics!.status!.planToWatch!),
    ];
    return items.reduce((value, element) => value > element ? value : element);
  }

  Container buildStatisticItem(BuildContext context, String title, String data,
      double width, int maxWidth) {
    Size size = MediaQuery.of(context).size;
    double finalWidth = size.width * .65 * width / maxWidth;

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            alignment: Alignment.centerRight,
            width: size.width * .23,
            child: Text(title),
          ),
          SizedBox(
            width: 5,
          ),
          maxWidth / 2 < width
              ? Container(
                  alignment: Alignment.centerRight,
                  width: finalWidth,
                  padding: EdgeInsets.all(3),
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    data,
                    style: TextStyle(color: Colors.white.withOpacity(.9)),
                  ),
                )
              : Row(
                  children: [
                    Container(
                      width: finalWidth,
                      padding: EdgeInsets.all(3),
                      color: Theme.of(context).primaryColor,
                      child: Text(''),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(data, style: TextStyle(color: Colors.black54)),
                  ],
                )
        ],
      ),
    );
  }

  Column buildRecommendations(DetailModel data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        data.recommendations!.isNotEmpty
            ? Container(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Recommendations:",
                  style: TextStyle(fontSize: 20),
                ),
              )
            : Container(),
        SizedBox(
          height: 10,
        ),
        data.recommendations != null
            ? SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      data.recommendations!.length,
                      (index) => Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 150,
                                      child:
                                          data.recommendations?[index] != null
                                              ? Image.network(data
                                                  .recommendations![index]
                                                  .node!
                                                  .mainPicture!
                                                  .medium!)
                                              : Container(),
                                    ),
                                    Positioned(
                                      bottom: 5,
                                      right: 5,
                                      left: 5,
                                      child: Text(
                                        data.recommendations![index].node!
                                            .title!,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            height: 1,
                                            color: Colors.white,
                                            fontSize: 12,
                                            shadows: [
                                              Shadow(
                                                  color: Colors.black,
                                                  blurRadius: 5),
                                            ]),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                    data.recommendations![index]
                                            .numRecommendations!
                                            .toString() +
                                        ' Members',
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ))
                              ],
                            ),
                          )),
                ),
              )
            : Container()
      ],
    );
  }

  Column buildTitleData(String title, String data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: Colors.black54)),
        Text(data)
      ],
    );
  }

  Container buildTypeEpMin(DetailModel data) {
    return Container(
      color: Colors.grey[100],
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          data.startSeason == null
              ? Container()
              : Text(
                  data.mediaType!.toUpperCase() +
                      ', ' +
                      data.startSeason!.year!.toString(),
                  style: TextStyle(color: Colors.black54),
                ),
          Text(
              data.numEpisodes == null
                  ? "? ep, ? min"
                  : data.numEpisodes!.toString() +
                      ' ep, ' +
                      (data.averageEpisodeDuration! ~/ 60).toString() +
                      ' min',
              style: TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }

  Stack buildTopPart(BuildContext context, DetailModel data) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 100,
              color: Theme.of(context).primaryColor,
            ),
            Container(
              height: 250,
            )
          ],
        ),
        Positioned(
          top: 20,
          left: 20,
          right: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                height: 300,
                width: 210,
                child: Image.network(data.mainPicture!.large!),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black45)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Score",
                    style: TextStyle(
                      color: Colors.white.withOpacity(.9),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.white.withOpacity(.9),
                      ),
                      Text(data.mean?.toString() ?? 'N/A',
                          style: TextStyle(
                              color: Colors.white.withOpacity(.9),
                              fontSize: 20,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  buildItem('#${data.rank?.toString() ?? 'N/A'}', "Rank"),
                  buildItem(
                      '#${data.popularity?.toString() ?? 'N/A'}', "Popularity"),
                  buildItem(data.numListUsers!.toString(), "Members"),
                  buildItem(data.numScoringUsers!.toString(), "Scoring Users"),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  SingleChildScrollView buildListPictures(DetailModel data) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
            data.pictures!.length,
            (index) => Container(
                  padding: EdgeInsets.only(left: 20),
                  height: 200,
                  child: Image.network(data.pictures![index].large!),
                )),
      ),
    );
  }

  Container buildGenres(DetailModel data) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Wrap(
        spacing: 20,
        runSpacing: 10,
        alignment: WrapAlignment.center,
        children: List.generate(
          data.genres!.length,
          (index) => Text(
            data.genres![index].name!,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Column buildSynopsis(DetailModel data) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: !isExtend
              ? Text(
                  data.synopsis!,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                )
              : Text(
                  data.synopsis!,
                ),
        ),
        !isExtend
            ? IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  size: 35,
                  color: Colors.black54,
                ),
                onPressed: () {
                  setState(() {
                    isExtend = !isExtend;
                  });
                },
              )
            : IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_up,
                  size: 35,
                  color: Colors.black54,
                ),
                onPressed: () {
                  setState(() {
                    isExtend = !isExtend;
                  });
                },
              ),
      ],
    );
  }

  Column buildItem(String dataName, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.black.withOpacity(.85),
          ),
        ),
        Row(
          children: [
            Text(dataName,
                style: TextStyle(
                  color: Colors.black.withOpacity(.85),
                  fontSize: 18,
                ))
          ],
        ),
      ],
    );
  }
}
