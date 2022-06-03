import 'dart:convert';

import 'package:my_animes/models/upcoming_model.dart';
import 'package:http/http.dart' as http;

class UpcomingApi {
  final String baseUrl =
      "https://api.myanimelist.net/v2/anime/ranking?ranking_type=upcoming&limit=10";

  Future<List<UpcomingModel>> getUpcoming() async {
    http.Response response = await http.get(
        Uri.parse(
          baseUrl,
        ),
        headers: {'X-MAL-CLIENT-ID': 'b13f3382fcf78f328b68bf04776b23ae'});
    var json = jsonDecode(response.body);
    List body = json['data'];
    if (response.statusCode == 200) {
      List<UpcomingModel> upcomings =
          body.map((e) => UpcomingModel.fromJson(e)).toList();
      return upcomings;
    } else {
      throw ("Can't get Upcomings");
    }
  }
}
