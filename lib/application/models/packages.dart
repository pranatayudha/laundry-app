class Packages {
  bool? success;
  List<Data>? data;
  String? message;
  int? code;

  Packages({
    this.success,
    this.data,
    this.message,
    this.code,
  });

  Packages.fromJson(Map<String, dynamic> json) {
    success = json['success'] as bool?;
    data = (json['data'] as List?)
        ?.map((dynamic e) => Data.fromJson(e as Map<String, dynamic>))
        .toList();
    message = json['message'] as String?;
    code = json['code'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['success'] = success;
    json['data'] = data?.map((e) => e.toJson()).toList();
    json['message'] = message;
    json['code'] = code;
    return json;
  }
}

class Data {
  String? id;
  String? packageName;
  String? desc;
  String? price;
  String? minKg;

  Data({
    this.id,
    this.packageName,
    this.desc,
    this.price,
    this.minKg,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    packageName = json['package_name'] as String?;
    desc = json['desc'] as String?;
    price = json['price'] as String?;
    minKg = json['min_kg'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['package_name'] = packageName;
    json['desc'] = desc;
    json['price'] = price;
    json['min_kg'] = minKg;
    return json;
  }
}
