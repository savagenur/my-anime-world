import 'package:flutter/material.dart';

class DiscoverCollectionItem extends StatelessWidget {
  List data;
  int index;
  DiscoverCollectionItem({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            data[index].image!,
            height: 200,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            data[index].title!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
