import 'package:flutter/material.dart';
import 'package:my_animes/pages/detail_page.dart';
import 'package:my_animes/widgets/discover_collection_item.dart';

class DiscoverCollection extends StatelessWidget {
  List data;
  String title;
  DiscoverCollection({
    Key? key,
    required this.data,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            title,
            style: TextStyle(fontSize: 18),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return data.length - 1 != index
                  ? index == 0
                      ? Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => DetailPage(
                                            id: data[index].id!.toString()))),
                                child: DiscoverCollectionItem(
                                    data: data, index: index))
                          ],
                        )
                      : InkWell(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                      id: data[index].id!.toString()))),
                          child:
                              DiscoverCollectionItem(data: data, index: index))
                  : Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: DiscoverCollectionItem(data: data, index: index),
                    );
            },
          ),
        ),
      ],
    );
  }
}
