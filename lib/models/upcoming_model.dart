class UpcomingModel {
  int? id;
  String? title;
  String? image;
  int? rank;
  UpcomingModel({
    this.id,
    this.image,
    this.rank,
    this.title,
  });
  UpcomingModel.fromJson(Map<String, dynamic> json) {
    id = json['node']['id'];
    title = json['node']['title'];
    image = json['node']['main_picture']['medium'];
    rank = json['ranking']['rank'];
  }
}
