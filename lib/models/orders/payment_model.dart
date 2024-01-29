class PaymentModel {
  String? shipmentAddress;
  String? shipmentPhone;
  String? cardNumber;
  String? expire;
  String? securityCode;

  PaymentModel({
    this.shipmentAddress,
    this.shipmentPhone,
    this.cardNumber,
    this.expire,
    this.securityCode,
  });

  PaymentModel.fromJson(Map<String, dynamic> json) {
    shipmentAddress = json['shipment_address'];
    shipmentPhone = json['shipment_phone'];
    cardNumber = json['card_number'];
    expire = json['expire'];
    securityCode = json['security_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['shipment_address'] = shipmentAddress;
    data['shipment_phone'] = shipmentPhone;
    data['card_number'] = cardNumber;
    data['expire'] = expire;
    data['security_code'] = securityCode;
    return data;
  }
}
