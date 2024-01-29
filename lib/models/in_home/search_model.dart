class SearchingModel {
  List<ProductSearchModel> product = [];

  SearchingModel({required this.product});

  SearchingModel.fromJson(Map<String, dynamic> json) {
    if (json['product'] != null) {
      product = <ProductSearchModel>[];
      json['product'].forEach((v) {
        product.add(ProductSearchModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product'] = product.map((v) => v.toJson()).toList();
    return data;
  }
}

class ProductSearchModel {
  int? id;
  String? photo;
  String? model;
  int? category;
  String? name;
  String? description;
  dynamic price;
  bool? onSale;
  dynamic oldPrice;
  bool? isAvailable;
  double? avgRating;
  int? numberRating;
  String? created;
  String? update;
  dynamic discount;
  int? providedBy;

  ProductSearchModel(
      {this.id,
        this.photo,
        this.model,
        this.category,
        this.name,
        this.description,
        this.price,
        this.onSale,
        this.oldPrice,
        this.isAvailable,
        this.avgRating,
        this.numberRating,
        this.created,
        this.update,
        this.discount,
        this.providedBy});

  ProductSearchModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
    model = json['model'];
    category = json['category'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    onSale = json['on_sale'];
    oldPrice = json['old_price'];
    isAvailable = json['is_available'];
    avgRating = json['avg_rating'];
    numberRating = json['number_rating'];
    created = json['created'];
    update = json['update'];
    discount = json['discount'];
    providedBy = json['provided_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['photo'] = photo;
    data['model'] = model;
    data['category'] = category;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['on_sale'] = onSale;
    data['old_price'] = oldPrice;
    data['is_available'] = isAvailable;
    data['avg_rating'] = avgRating;
    data['number_rating'] = numberRating;
    data['created'] = created;
    data['update'] = update;
    data['discount'] = discount;
    data['provided_by'] = providedBy;
    return data;
  }
}
