import 'package:intl/intl.dart';

class DateTimeUtils {
  static const String dmySlashFormat = 'dd/MM/yyyy';

  static DateTime dmySlashToDateTime({required String source}) {
    return DateFormat(dmySlashFormat).parse(source);
  }

  static DateTime stringToDateTime({required String source, required String format}) {
    return DateFormat(format).parse(source);
  }

  static String getDayOfMonthFromString({required String source, required String format}) {
    var dateTime =  DateFormat(format).parse(source);
    var dayOfMonth = dateTime.day;
    if(dayOfMonth == 1) return '1st';
    if(dayOfMonth == 2) return '2nd';
    if(dayOfMonth == 3) return '3rd';
    return '${dayOfMonth}th';
  }

  static String getMonthNameFromString({required String source, required String format}) {
    var dateTime =  DateFormat(format).parse(source);
    return DateFormat('MMMM').format(dateTime);
  }

  static String getDayNameOfWeekFromString({required String source, required String format}) {
    var dateTime =  DateFormat(format).parse(source);
    return DateFormat('EEEE').format(dateTime);
  }
}
