import 'package:app/extensions/string_ext.dart';
import 'package:intl/intl.dart';

class Formatters {
  // NumberFormat.currency().format(123456); // USD123,456.00
  // NumberFormat.currency(locale: 'eu').format(123456); // 123.456,00 EUR
  // NumberFormat.currency(name: 'EURO').format(123456); // EURO123,456.00
  // NumberFormat.currency(locale: 'eu', symbol: '?').format(123456); // 123.456,00 ?
  // NumberFormat.currency(locale: 'eu', decimalDigits: 3).format(123456); // 123.456,000 EUR
  // NumberFormat.currency(locale: 'eu', customPattern: '\u00a4 #,##.#').format(123456); // EUR 12.34.56,00

  String formatDecimalNumber(String value) {
    var formatter = NumberFormat.decimalPattern();
    return formatter.format(value.stringToInt);
  }

  String formatDate(String format, String? date) {
    if (date == null) return '';
    var formatter = DateFormat(format);
    return formatter.format(date.parseDate.toLocal());
  }

  /*String formatTime(String? date) {
    if (date == null) return '';
    return time_ago.format(date.parseDate, locale: 'en', allowFromNow: true);
  }*/
}
