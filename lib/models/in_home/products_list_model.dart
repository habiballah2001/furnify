class ProductsModel {
  List<ProductModel> products = [];

  ProductsModel({required this.products});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <ProductModel>[];
      json['products'].forEach((v) {
        products.add(ProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['products'] = products.map((v) => v.toJson()).toList();
    return data;
  }
}

class ProductModel {
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
  int? providedBy;
  //
  //Discount? discount;
  bool? onSale;
  dynamic oldPrice;
  dynamic avgRating;
  dynamic numberRating;

  ProductModel({
    this.id,
    this.name,
    this.photo,
    this.model,
    this.description,
    this.price,
    this.isAvailable,
    this.category,
    this.created,
    this.update,
    this.providedBy,
    //
    //this.discount,
    this.onSale,
    this.oldPrice,
    this.avgRating,
    this.numberRating,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
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
    providedBy = json['providedBy'];
    //
    //discount = json['discount'];
    onSale = json['onSale'];
    oldPrice = json['oldPrice'];
    avgRating = json['avgRating'];
    numberRating = json['numberRating'];
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
    data['providedBy'] = providedBy;
    //
    //data['discount'] = discount;
    data['onSale'] = onSale;
    data['oldPrice'] = oldPrice;
    data['avgRating'] = avgRating;
    data['numberRating'] = numberRating;
    return data;
  }
}

/*
class ProductsModel {
  List<ProductModel> products = [];

  ProductsModel({required this.products});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <ProductModel>[];
      json['products'].forEach((v) {
        products.add(ProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['products'] = products.map((v) => v.toJson()).toList();
    return data;
  }
}

class ProductModel {
  int? id;
  String? photo;
  String? model;
  int? category;
  Discount? discount;
  String? name;
  String? description;
  int? price;
  bool? onSale;
  dynamic oldPrice;
  bool? isAvailable;
  int? avgRating;
  int? numberRating;
  String? created;
  String? update;
  int? providedBy;

  ProductModel(
      {this.id,
        this.photo,
        this.model,
        this.category,
        this.discount,
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
        this.providedBy});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
    model = json['model'];
    category = json['category'];
    discount = json['discount'] != null
        ? Discount.fromJson(json['discount'])
        : null;
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
    providedBy = json['provided_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['photo'] = photo;
    data['model'] = model;
    data['category'] = category;
    if (discount != null) {
      data['discount'] = discount!.toJson();
    }
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
    data['provided_by'] = providedBy;
    return data;
  }
}

class Discount {
  int? id;
  String? name;
  int? percentage;

  Discount({this.id, this.name, this.percentage});

  Discount.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['percentage'] = percentage;
    return data;
  }
}
*/
