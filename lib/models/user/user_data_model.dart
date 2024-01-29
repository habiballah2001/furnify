class UserDataModel {
  String? response;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? address;
  String? city;
  bool? isActive;
  String? token;

  UserDataModel({
    this.response,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.address,
    this.city,
    this.isActive,
    this.token,
  });

  UserDataModel.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    city = json['city'];
    isActive = json['is_active'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['response'] = response;
    data['username'] = username;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['address'] = address;
    data['city'] = city;
    data['is_active'] = isActive;
    data['token'] = token;
    return data;
  }
}
