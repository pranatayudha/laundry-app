class InvoiceModel {
  bool? success;
  Invoice? data;
  String? message;
  int? code;

  InvoiceModel({
    this.success,
    this.data,
    this.message,
    this.code,
  });

  InvoiceModel.fromJson(Map<String, dynamic> json) {
    success = json['success'] as bool?;
    data = (json['data'] as Map<String, dynamic>?) != null
        ? Invoice.fromJson(json['data'] as Map<String, dynamic>)
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

class Invoice {
  String? id;
  String? customerName;
  String? phoneNumber;
  String? paidType;
  String? packageName;
  String? weight;
  String? price;
  String? totalPrice;
  String? pendingPaid;
  String? paidOff;
  String? date;
  String? status;
  String? returnPaid;
  String? kasir;
  String? idKasir;
  String? branchKasir;
  String? createdAt;

  Invoice({
    this.id,
    this.customerName,
    this.phoneNumber,
    this.paidType,
    this.packageName,
    this.weight,
    this.price,
    this.totalPrice,
    this.pendingPaid,
    this.paidOff,
    this.date,
    this.status,
    this.returnPaid,
    this.kasir,
    this.idKasir,
    this.branchKasir,
    this.createdAt,
  });

  Invoice.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    customerName = json['customer_name'] as String?;
    phoneNumber = json['phone_number'] as String?;
    paidType = json['paid_type'] as String?;
    packageName = json['package_name'] as String?;
    weight = json['weight'] as String?;
    price = json['price'] as String?;
    totalPrice = json['total_price'] as String?;
    pendingPaid = json['pending_paid'] as String?;
    paidOff = json['paid_off'] as String?;
    date = json['date'] as String?;
    status = json['status'] as String?;
    returnPaid = json['returnPaid'] as String?;
    kasir = json['kasir'] as String?;
    idKasir = json['id_kasir'] as String?;
    branchKasir = json['branch_kasir'] as String?;
    createdAt = json['createdAt'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['customer_name'] = customerName;
    json['phone_number'] = phoneNumber;
    json['paid_type'] = paidType;
    json['package_name'] = packageName;
    json['weight'] = weight;
    json['price'] = price;
    json['total_price'] = totalPrice;
    json['pending_paid'] = pendingPaid;
    json['paid_off'] = paidOff;
    json['date'] = date;
    json['status'] = status;
    json['returnPaid'] = returnPaid;
    json['kasir'] = kasir;
    json['id_kasir'] = idKasir;
    json['branch_kasir'] = branchKasir;
    json['createdAt'] = createdAt;
    return json;
  }
}
