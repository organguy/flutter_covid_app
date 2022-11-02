import 'package:intl/intl.dart';

class DataUtils{
  static String numberFormat(double? value){
    return NumberFormat('###,###,###,###').format(value);
  }

  static String simpleDayFormat(String dateTime){

    DateTime date = DateTime.parse(dateTime);

    return DateFormat('MM.dd').format(date);
  }
}