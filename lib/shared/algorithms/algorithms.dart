import 'dart:math';

abstract class Algorithms {
  Algorithms._();
  static String getFirstTwoWords(String input) {
    // Split the string by whitespace
    List<String> words = input.split(' ');

    // Check if there are at least 2 words
    if (words.length >= 2) {
      // Join the first two words with a space
      return '${words[0]} ${words[1]}';
    } else if (words.length == 1) {
      // Return the only word if string has just one word
      return words[0];
    } else {
      // Return empty string if input was empty
      return '';
    }
  }

  static String padStringToThreeChars({required String input}) {
    if (input.length >= 3) {
      return input;
    }

    final random = Random();
    String padded = input;

    while (padded.length < 3) {
      padded += random.nextInt(10).toString();
    }

    return padded;
  }

  // Helper function to get a human-readable time difference
  static String getTimeAgo({required Duration difference}) {
    if (difference.inDays > 365) {
      return '${(difference.inDays / 365).floor()} years ago';
    } else if (difference.inDays > 30) {
      return '${(difference.inDays / 30).floor()} months ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }
}
