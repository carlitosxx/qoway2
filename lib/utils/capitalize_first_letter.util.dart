/// Capitaliza la primera letra de una palabra
String capitalizeFirstLetter(String text) {
  if (text.isEmpty) {
    return text;
  }
  final words = text.split(' ');
  final capitalizedWords = words.map((word) {
    if (word.isNotEmpty) {
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }
    return '';
  });
  return capitalizedWords.join(' ');
}
