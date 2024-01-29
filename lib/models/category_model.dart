class CategoriesModel {
  List<CategoryModel> categoryItemList = [];

  CategoriesModel({required this.categoryItemList});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categoryItemList = <CategoryModel>[];
      json['categories'].forEach((v) {
        categoryItemList.add(CategoryModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categories'] = categoryItemList.map((v) => v.toJson()).toList();
    return data;
  }
}

class CategoryModel {
  int? id;
  String? name;
  String? photo;

  CategoryModel({this.id, this.name,this.photo});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['photo'] = photo;
    return data;
  }
}
