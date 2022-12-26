// ignore_for_file: empty_constructor_bodies, override_on_non_overriding_member, file_names


class GetDeals {
  String name;
  String desc;
  int actual;
  int offer;
  int count;
  String card;
  int earning;
  String images;

  GetDeals(this.actual, this.card, this.count, this.desc, this.earning,
      this.images, this.name, this.offer);

  GetDeals.fromJson(Map<dynamic, dynamic> json)
      : actual = json["actual_price"] as int,
        card = json["card"] as String,
        count = json["countleft"] as int,
        desc = json["description"] as String,
        earning = json["user_earning"] as int,
        images = json["photourl"] as String,
        name = json["product_name"] as String,
        offer = json["offer_price"] as int;

  static List<GetDeals> dealsfromapi(List api) {
    return api.map((e) {
      return GetDeals.fromJson(e);
    }).toList();
  }

  @override
  String tostring() {
    return '{name:$name, image:$images, actual:$actual, offer:$offer, card:$card, earning:$earning desc:$desc, count:$count';
  }
}
