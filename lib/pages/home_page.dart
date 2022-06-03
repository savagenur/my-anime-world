import 'package:flutter/material.dart';
import 'package:my_animes/pages/detail_page.dart';

import '../services/apis/upcoming_api.dart';
import '../widgets/anime_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UpcomingApi().getUpcoming(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List upcomings = snapshot.data;
          return Scaffold(
            body: ListView.builder(
              key: PageStorageKey(0),
              itemCount: upcomings.length,
              itemBuilder: (context, index) {
                return upcomings.length - 1 != index
                    ? InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(id: upcomings[index].id!.toString())));
                        },
                        child: AnimeItem(
                          data: upcomings,
                          index: index,
                        ),
                      )
                    : Column(
                        children: [
                          InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(id: upcomings[index].id!.toString())));
                        },
                        child: AnimeItem(
                          data: upcomings,
                          index: index,
                        ),
                      ),
                          SizedBox(
                            height: 20,
                          ),
                          FloatingActionButton.extended(
                              onPressed: () {}, label: Text("Load more")),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      );
              },
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
