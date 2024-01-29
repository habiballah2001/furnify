class ServicesModel {
  List<ServiceModel> serviceCategory = [];

  ServicesModel({required this.serviceCategory});

  ServicesModel.fromJson(Map<String, dynamic> json) {
    if (json['service_category'] != null) {
      serviceCategory = <ServiceModel>[];
      json['service_category'].forEach((v) {
        serviceCategory.add(ServiceModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['service_category'] = serviceCategory.map((v) => v.toJson()).toList();
    return data;
  }
}

class ServiceModel {
  int? id;
  String? photo;
  String? name;
  bool? isAvailable;

  ServiceModel({this.id, this.photo, this.name, this.isAvailable});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
    name = json['name'];
    isAvailable = json['is_available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['photo'] = photo;
    data['name'] = name;
    data['is_available'] = isAvailable;
    return data;
  }
}
