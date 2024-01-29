class FavoritesModel {
  List<FavProductModel> productFavorite = [];

  FavoritesModel({required this.productFavorite});

  FavoritesModel.fromJson(Map<String, dynamic> json) {
    if (json['product_favorite'] != null) {
      productFavorite = <FavProductModel>[];
      json['product_favorite'].forEach((v) {
        productFavorite.add(FavProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_favorite'] =
        productFavorite.map((v) => v.toJson()).toList();
    return data;
  }
}

class FavProductModel {
  int? id;
  String? name;
  String? photo;
  String? model;
  String? description;
  dynamic price;
  bool? isAvailable;
  int? category;
  String? created;
  String? update;

  FavProductModel(
      {this.id,
        this.name,
        this.photo,
        this.model,
        this.description,
        this.price,
        this.isAvailable,
        this.category,
        this.created,
        this.update,});

  FavProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
    model = json['model'];
    description = json['description'];
    price = json['price'];
    isAvailable = json['is_available'];
    category = json['category'];
    created = json['created'];
    update = json['update'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['photo'] = photo;
    data['model'] = model;
    data['description'] = description;
    data['price'] = price;
    data['is_available'] = isAvailable;
    data['category'] = category;
    data['created'] = created;
    data['update'] = update;
    return data;
  }
}
