import 'package:intl/intl.dart';

class DateStringFormatter {
  static String forOutput(String dateString) {
    final inputFormat = DateFormat('dd/MM/yyyy');
    final date = inputFormat.parse(dateString);
    final outputFormat = DateFormat('yyyy-MM-dd');

    return outputFormat.format(date);
  }

  static String forInput(String dateString) {
    final inputFormat = DateFormat('dd/MM/yyyy');
    final date = DateTime.parse(dateString);

    return inputFormat.format(date);
  }

  static String forOutputRitel(String dateString) {
    final inputFormat = DateFormat('yyyy-MM-ddTHH:mm:ssZ');
    final date = inputFormat.parse(dateString);
    final outputFormat = DateFormat('dd MMMM yyyy');

    return outputFormat.format(date);
  }

  static String forOutputRitelKTPTerbit(String dateString) {
    final inputFormat = DateFormat('yyyy-MM-ddTHH:mm:ssZ');
    final date = inputFormat.parse(dateString);
    final outputFormat = DateFormat('dd/MM/yyyy');

    return outputFormat.format(date);
  }

  static String forOutputRitelKTPTerbitInfoDebitur(String dateString) {
    final inputFormat = DateFormat('yyyy-MM-ddTHH:mm:ssZ');
    final date = inputFormat.parse(dateString);
    final outputFormat = DateFormat('dd MMM yyyy');

    return outputFormat.format(date);
  }
}
