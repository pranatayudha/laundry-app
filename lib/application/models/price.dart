class PriceModel {
  bool? success;
  Price? data;
  String? message;
  int? code;

  PriceModel({
    this.success,
    this.data,
    this.message,
    this.code,
  });

  PriceModel.fromJson(Map<String, dynamic> json) {
    success = json['success'] as bool?;
    data = (json['data'] as Map<String, dynamic>?) != null
        ? Price.fromJson(json['data'] as Map<String, dynamic>)
        : null;
    message = json['message'] as String?;
    code = json['code'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['success'] = success;
    json['data'] = data?.toJson();
    json['message'] = message;
    json['code'] = code;
    return json;
  }
}

class Price {
  String? price;
  String? totalPrice;

  Price({
    this.price,
    this.totalPrice,
  });

  Price.fromJson(Map<String, dynamic> json) {
    price = json['price'] as String?;
    totalPrice = json['total_price'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['price'] = price;
    json['total_price'] = totalPrice;
    return json;
  }
}
