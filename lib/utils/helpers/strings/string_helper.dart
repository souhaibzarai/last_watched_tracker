class StringHelper {
  StringHelper._();
  static String capitalizeAString(String phrase) {
    final trimedPhrase = phrase.trim();
    return trimedPhrase[0].toUpperCase() +
        trimedPhrase.substring(1).toLowerCase().trim();
  }
}
