class PercentageHelper {
  PercentageHelper._();

  static String getPercentage(String main, String? cond) {
    String percentage = '0';
    if (cond == null || cond == '') {
      percentage = '0';
    } else {
      percentage =
          ((int.parse(main) / int.parse(cond)) * 100).round().toString();
    }

    return '$percentage %';
  }
}
