
class CartsModel {
  int? id;
  List<CartDetailsModel> details = [];
  String? user;
  dynamic total;
  int? itemsCount;
  String? orderDate;
  bool? isFinished;

  CartsModel(
      {this.id,
        required this.details,
        this.user,
        this.total,
        this.itemsCount,
        this.orderDate,
        this.isFinished});

  CartsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['details'] != null) {
      details = <CartDetailsModel>[];
      json['details'].forEach((v) {
        details.add(CartDetailsModel.fromJson(v));
      });
    }
    user = json['user'];
    total = json['total'];
    itemsCount = json['items_count'];
    orderDate = json['order_date'];
    isFinished = json['is_finished'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['details'] = details.map((v) => v.toJson()).toList();
    data['user'] = user;
    data['total'] = total;
    data['items_count'] = itemsCount;
    data['order_date'] = orderDate;
    data['is_finished'] = isFinished;
    return data;
  }
}

class CartDetailsModel {
  int? id;
  CartProduct? product;
  int? quantity;

  CartDetailsModel({this.id, this.product, this.quantity});

  CartDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
    json['product'] != null ? CartProduct.fromJson(json['product']) : null;
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    data['quantity'] = quantity;
    return data;
  }
}

class CartProduct {
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
  dynamic avgRating;
  dynamic numberRating;
  String? created;
  String? update;
  dynamic discount;
  int? providedBy;

  CartProduct(
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

  CartProduct.fromJson(Map<String, dynamic> json) {
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
