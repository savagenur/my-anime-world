class DetailModel {
  int? id;
  String? title;
  MainPicture? mainPicture;
  String? startDate;
  String? synopsis;
  double? mean;
  int? rank;
  int? popularity;
  int? numListUsers;
  int? numScoringUsers;
  String? nsfw;
  String? createdAt;
  String? updatedAt;
  String? mediaType;
  String? status;
  List<Genres>? genres;
  int? numEpisodes;
  StartSeason? startSeason;
  Broadcast? broadcast;
  String? source;
  int? averageEpisodeDuration;
  String? rating;
  List<Pictures>? pictures;
  String? background;
  List<RelatedAnime>? relatedAnime;
  List<Null>? relatedManga;
  List<Recommendations>? recommendations;
  Statistics? statistics;

  DetailModel(
      {this.id,
      this.title,
      this.mainPicture,
      this.startDate,
      this.synopsis,
      this.mean,
      this.rank,
      this.popularity,
      this.numListUsers,
      this.numScoringUsers,
      this.nsfw,
      this.createdAt,
      this.updatedAt,
      this.mediaType,
      this.status,
      this.genres,
      this.numEpisodes,
      this.startSeason,
      this.broadcast,
      this.source,
      this.averageEpisodeDuration,
      this.rating,
      this.pictures,
      this.background,
      this.relatedAnime,
      this.relatedManga,
      this.recommendations,
      this.statistics});

  DetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    mainPicture = json['main_picture'] != null
        ? new MainPicture.fromJson(json['main_picture'])
        : null;
    
    startDate = json['start_date'];
    synopsis = json['synopsis'];
    mean = json['mean'];
    rank = json['rank'];
    popularity = json['popularity'];
    numListUsers = json['num_list_users'];
    numScoringUsers = json['num_scoring_users'];
    nsfw = json['nsfw'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    mediaType = json['media_type'];
    status = json['status'];
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(new Genres.fromJson(v));
      });
    }
    numEpisodes = json['num_episodes'];
    startSeason = json['start_season'] != null
        ? new StartSeason.fromJson(json['start_season'])
        : null;
    broadcast = json['broadcast'] != null
        ? new Broadcast.fromJson(json['broadcast'])
        : null;
    source = json['source'];
    averageEpisodeDuration = json['average_episode_duration'];
    rating = json['rating'];
    if (json['pictures'] != null) {
      pictures = <Pictures>[];
      json['pictures'].forEach((v) {
        pictures!.add(new Pictures.fromJson(v));
      });
    }
    background = json['background'];
    if (json['related_anime'] != null) {
      relatedAnime = <RelatedAnime>[];
      json['related_anime'].forEach((v) {
        relatedAnime!.add(new RelatedAnime.fromJson(v));
      });
    }

    if (json['recommendations'] != null) {
      recommendations = <Recommendations>[];
      json['recommendations'].forEach((v) {
        recommendations!.add(new Recommendations.fromJson(v));
      });
    }

    statistics = json['statistics'] != null
        ? new Statistics.fromJson(json['statistics'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.mainPicture != null) {
      data['main_picture'] = this.mainPicture!.toJson();
    }
    
    data['start_date'] = this.startDate;
    data['synopsis'] = this.synopsis;
    data['mean'] = this.mean;
    data['rank'] = this.rank;
    data['popularity'] = this.popularity;
    data['num_list_users'] = this.numListUsers;
    data['num_scoring_users'] = this.numScoringUsers;
    data['nsfw'] = this.nsfw;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['media_type'] = this.mediaType;
    data['status'] = this.status;
    if (this.genres != null) {
      data['genres'] = this.genres!.map((v) => v.toJson()).toList();
    }
    data['num_episodes'] = this.numEpisodes;
    if (this.startSeason != null) {
      data['start_season'] = this.startSeason!.toJson();
    }
    if (this.broadcast != null) {
      data['broadcast'] = this.broadcast!.toJson();
    }
    data['source'] = this.source;
    data['average_episode_duration'] = this.averageEpisodeDuration;
    data['rating'] = this.rating;
    
    data['background'] = this.background;
    if (this.relatedAnime != null) {
      data['related_anime'] =
          this.relatedAnime!.map((v) => v.toJson()).toList();
    }

    if (this.recommendations != null) {
      data['recommendations'] =
          this.recommendations!.map((v) => v.toJson()).toList();
    }
    
    if (this.statistics != null) {
      data['statistics'] = this.statistics!.toJson();
    }
    return data;
  }
}

class MainPicture {
  String? medium;
  String? large;

  MainPicture({this.medium, this.large});

  MainPicture.fromJson(Map<String, dynamic> json) {
    medium = json['medium'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['medium'] = this.medium;
    data['large'] = this.large;
    return data;
  }
}

class Genres {
  int? id;
  String? name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class StartSeason {
  int? year;
  String? season;

  StartSeason({this.year, this.season});

  StartSeason.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    season = json['season'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['season'] = this.season;
    return data;
  }
}

class Broadcast {
  String? dayOfTheWeek;
  String? startTime;

  Broadcast({this.dayOfTheWeek, this.startTime});

  Broadcast.fromJson(Map<String, dynamic> json) {
    dayOfTheWeek = json['day_of_the_week'];
    startTime = json['start_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day_of_the_week'] = this.dayOfTheWeek;
    data['start_time'] = this.startTime;
    return data;
  }
}

class RelatedAnime {
  Node? node;
  String? relationType;
  String? relationTypeFormatted;

  RelatedAnime({this.node, this.relationType, this.relationTypeFormatted});

  RelatedAnime.fromJson(Map<String, dynamic> json) {
    node = json['node'] != null ? new Node.fromJson(json['node']) : null;
    relationType = json['relation_type'];
    relationTypeFormatted = json['relation_type_formatted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.node != null) {
      data['node'] = this.node!.toJson();
    }
    data['relation_type'] = this.relationType;
    data['relation_type_formatted'] = this.relationTypeFormatted;
    return data;
  }
}

class Node {
  int? id;
  String? title;
  MainPicture? mainPicture;

  Node({this.id, this.title, this.mainPicture});

  Node.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    mainPicture = json['main_picture'] != null
        ? new MainPicture.fromJson(json['main_picture'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.mainPicture != null) {
      data['main_picture'] = this.mainPicture!.toJson();
    }
    return data;
  }
}

class Recommendations {
  Node? node;
  int? numRecommendations;

  Recommendations({this.node, this.numRecommendations});

  Recommendations.fromJson(Map<String, dynamic> json) {
    node = json['node'] != null ? new Node.fromJson(json['node']) : null;
    numRecommendations = json['num_recommendations'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.node != null) {
      data['node'] = this.node!.toJson();
    }
    data['num_recommendations'] = this.numRecommendations;
    return data;
  }
}

class Statistics {
  Status? status;
  int? numListUsers;

  Statistics({this.status, this.numListUsers});

  Statistics.fromJson(Map<String, dynamic> json) {
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
    numListUsers = json['num_list_users'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    data['num_list_users'] = this.numListUsers;
    return data;
  }
}

class Status {
  String? watching;
  String? completed;
  String? onHold;
  String? dropped;
  String? planToWatch;

  Status(
      {this.watching,
      this.completed,
      this.onHold,
      this.dropped,
      this.planToWatch});

  Status.fromJson(Map<String, dynamic> json) {
    watching = json['watching'];
    completed = json['completed'];
    onHold = json['on_hold'];
    dropped = json['dropped'];
    planToWatch = json['plan_to_watch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['watching'] = this.watching;
    data['completed'] = this.completed;
    data['on_hold'] = this.onHold;
    data['dropped'] = this.dropped;
    data['plan_to_watch'] = this.planToWatch;
    return data;
  }
}

class Pictures {
  String? medium;
  String? large;
  Pictures({this.large, this.medium});

  Pictures.fromJson(Map<String, dynamic> json) {
    medium = json['medium'];
    large = json['large'];
  }
}
