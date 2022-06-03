import 'package:flutter/material.dart';
import 'package:my_animes/services/apis/airing_api.dart';
import 'package:my_animes/services/apis/by_popularity.dart';
import 'package:my_animes/services/apis/movie_api.dart';
import 'package:my_animes/services/apis/tv_api.dart';
import 'package:my_animes/widgets/discover_col_future.dart';

import '../widgets/discover_collection.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              margin: EdgeInsets.only(right: 20, left: 20, bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DiscoverColFuture(
                    title: "Top 10 Airing",
                    future: AiringApi().getData(),
                  ),
                  DiscoverColFuture(
                    title: "Top 10 Movies",
                    future: MovieApi().getData(),
                  ),
                  DiscoverColFuture(
                    title: "Top 10 TV Series",
                    future: TvApi().getData(),
                  ),
                  DiscoverColFuture(
                    title: "Top 10 By Popularity",
                    future: ByPopularityApi().getData(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
