import 'dart:convert';

import 'package:my_animes/models/detail_model.dart';
import 'package:http/http.dart' as http;

class DetailApi {
  Future<DetailModel> getDetail(String id) async {
    String baseUrl =
        'https://api.myanimelist.net/v2/anime/$id?fields=id,title,main_picture,alternative_titles,start_date,end_date,synopsis,mean,rank,popularity,num_list_users,num_scoring_users,nsfw,created_at,updated_at,media_type,status,genres,my_list_status,num_episodes,start_season,broadcast,source,average_episode_duration,rating,pictures,background,related_anime,related_manga,recommendations,studios,statistics';

    http.Response response = await http.get(Uri.parse(baseUrl),
        headers: {'X-MAL-CLIENT-ID': 'b13f3382fcf78f328b68bf04776b23ae'});

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      DetailModel detail = DetailModel.fromJson(json);
      return detail;
    } else {
      throw ("Can't get Detail");
    }
  }
}
