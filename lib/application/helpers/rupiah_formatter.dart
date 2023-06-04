import 'package:intl/intl.dart';

var formatter = NumberFormat("#,###", "id_ID");
String rupiah(value, {String separator = '.', String trailing = ""}) {
  return 'Rp. ${formatter.format(double.parse(value.toString()))}';
}
