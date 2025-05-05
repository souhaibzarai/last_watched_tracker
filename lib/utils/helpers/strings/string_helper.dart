import 'package:cloud_firestore/cloud_firestore.dart';

class StringHelper {
  StringHelper._();
  static String capitalizeAString(String phrase) {
    final trimedPhrase = phrase.trim();
    return trimedPhrase[0].toUpperCase() +
        trimedPhrase.substring(1).toLowerCase().trim();
  }

  static String getChaptersTextCount(String progress, String? total) {
    String totalCount = '?';
    if (total == '' || total == null || total.isEmpty) {
      totalCount = '?';
    } else {
      totalCount = total;
    }

    return '$progress / $totalCount chapters';
  }

  static String formatTimestamp(Timestamp timestamp) {
    final date = timestamp.toDate();
    return '${date.day}/${date.month}/${date.year}';
  }
}
