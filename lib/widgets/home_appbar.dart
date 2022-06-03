
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_animes/pages/main_page.dart';

AppBar homeAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text("MyAnimeWorld"),
      actions: [
        Icon(Icons.notifications)
        ,
        SizedBox(width: 15,)
      ],
    );
  }
