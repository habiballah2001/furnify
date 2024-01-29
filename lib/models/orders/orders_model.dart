class OrdersModel {
  List<OrdersListModel> orders = [];

  OrdersModel({required this.orders});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <OrdersListModel>[];
      json['orders'].forEach((v) {
        orders.add(OrdersListModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orders'] = orders.map((v) => v.toJson()).toList();
    return data;
  }
}

class OrdersListModel {
  int? id;
  List<OrderDetailsModel> details = [];
  String? user;
  dynamic total;
  int? itemsCount;
  String? orderDate;
  bool? isFinished;

  OrdersListModel({
    this.id,
    required this.details,
    this.user,
    this.total,
    this.itemsCount,
    this.orderDate,
    this.isFinished,
  });

  OrdersListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['details'] != null) {
      details = <OrderDetailsModel>[];
      json['details'].forEach((v) {
        details.add(OrderDetailsModel.fromJson(v));
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

class OrderDetailsModel {
  OrderProduct? product;
  int? quantity;

  OrderDetailsModel({this.product, this.quantity});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? OrderProduct.fromJson(json['product']) : null;
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (product != null) {
      data['product'] = product!.toJson();
    }
    data['quantity'] = quantity;
    return data;
  }
}

class OrderProduct {
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
  int? providedBy;

  OrderProduct(
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
      this.providedBy});

  OrderProduct.fromJson(Map<String, dynamic> json) {
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
    providedBy = json['provided_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['photo'] = photo;
    data['model'] = model;
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
