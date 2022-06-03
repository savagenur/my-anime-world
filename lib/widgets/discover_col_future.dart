import 'package:flutter/material.dart';
import 'package:my_animes/widgets/discover_collection.dart';

class DiscoverColFuture extends StatelessWidget {
  String title;
  Future<dynamic> future;
  DiscoverColFuture({
    Key? key,
    required this.future,
    required this.title
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return DiscoverCollection(
            data: snapshot.data,
            title: title,
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(50.0),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}