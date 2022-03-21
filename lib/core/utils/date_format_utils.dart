import 'package:intl/intl.dart';

class DateFormatUtil {
  DateFormatUtil._();

  static final dateTimeFormat = DateFormat('dd MMM yyyy, hh:mm a');
  static final dateFormat = DateFormat('dd MMM, yyyy');

  static String format(DateTime date) {
    String suffix = "th";
    var digit = date.day % 10; 
    if ((digit > 0 && digit < 4) && (date.day < 11 || date.day > 13)) {  
      suffix = ["st", "nd", "rd"][digit - 1];
    }
    return DateFormat("dd'$suffix' MMM. yyyy").format(date);
  }
}