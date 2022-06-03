import 'package:flutter/material.dart';
import 'package:my_animes/models/upcoming_model.dart';

class AnimeItem extends StatelessWidget {
  List data;
  int index;
  AnimeItem({Key? key, required this.data, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            data[index].image!,
            width: 100,
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data[index].title!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Rank: ${data[index].rank!}",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),Text(
                  "Id: ${data[index].id!.toString()}",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.black12,
                        )),
                        child: Text(
                          "Anime Info",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star_outline,
                            color: Colors.yellow[700],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.black45,
          ),
        ),
      ),
    );
  }
}
