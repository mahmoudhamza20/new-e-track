import 'package:etrack/utility/app_setting.dart';
import 'package:intl/intl.dart';

String formatDate(String dateTimeStr) {
  DateTime parsedDate = DateFormat("dd-MM-yyyy HH:mm:ss").parse(dateTimeStr);

  return DateFormat('yyyy/MM/dd').format(parsedDate);
}

String formatDateAsTimeAndDate(String dateTimeStr) {
  DateTime parsedDate = DateFormat("dd-MM-yyyy HH:mm:ss").parse(dateTimeStr);

  return DateFormat(
          isArabic ? "dd MMM yyyy | hh:mm a" : "dd MMM yyyy | hh:mm a",
          isArabic ? 'ar' : 'en')
      .format(parsedDate);
}

String formatDateHijry(String dateTimeStr) {
  DateFormat inputFormat = DateFormat("M/d/yyyy h:mm:ss a");

  DateTime parsedDate = inputFormat.parse(dateTimeStr);

  DateFormat outputFormat = DateFormat("M/d/yyyy");

  return outputFormat.format(parsedDate);
}
