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
}
