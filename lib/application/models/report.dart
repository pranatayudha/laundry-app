class ReportModel {
  bool? success;
  Data? data;
  String? message;
  int? code;

  ReportModel({
    this.success,
    this.data,
    this.message,
    this.code,
  });

  ReportModel.fromJson(Map<String, dynamic> json) {
    success = json['success'] as bool?;
    data = (json['data'] as Map<String, dynamic>?) != null
        ? Data.fromJson(json['data'] as Map<String, dynamic>)
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

class Data {
  String? estimasiPendapatanTotal;
  String? pendapatanLunas;
  String? pendapatanBelumLunas;
  List<String>? listPending;

  Data({
    this.estimasiPendapatanTotal,
    this.pendapatanLunas,
    this.pendapatanBelumLunas,
    this.listPending,
  });

  Data.fromJson(Map<String, dynamic> json) {
    estimasiPendapatanTotal = json['estimasiPendapatanTotal'] as String?;
    pendapatanLunas = json['pendapatanLunas'] as String?;
    pendapatanBelumLunas = json['pendapatanBelumLunas'] as String?;
    listPending = (json['listPending'] as List?)
        ?.map((dynamic e) => e as String)
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['estimasiPendapatanTotal'] = estimasiPendapatanTotal;
    json['pendapatanLunas'] = pendapatanLunas;
    json['pendapatanBelumLunas'] = pendapatanBelumLunas;
    json['listPending'] = listPending;
    return json;
  }
}
