class PicturesModel {
  String? id;
  String? url;

  PicturesModel({this.id, this.url});

  PicturesModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    url = json["url"];
  }
}
