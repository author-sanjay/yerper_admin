// ignore_for_file: empty_constructor_bodies, override_on_non_overriding_member, file_names

class GetCards {
  int id;
  String images;

  GetCards(this.id, this.images);

  GetCards.fromJson(Map<dynamic, dynamic> json)
      : images = json["photo"] as String,
        id = json["id"] as int;

  static List<GetCards> dealsfromapi(List api) {
    return api.map((e) {
      return GetCards.fromJson(e);
    }).toList();
  }

  @override
  String tostring() {
    return '{ image:$images';
  }
}
