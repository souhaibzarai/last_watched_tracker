class PercentageHelper {
  PercentageHelper._();

  static int getPercentage(String main, String? cond) {
    int percentage = 0;
    if (cond == null || cond == '') {
      percentage = 0;
    } else {
      percentage = ((int.parse(main) / int.parse(cond)) * 100).round();
    }

    return percentage;
  }
}
