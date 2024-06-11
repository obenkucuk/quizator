extension StringExtension on String {
  String toTitleCase() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String decodeHTML() {
    // HTML kodlarını temizle
    String decodedText = replaceAllMapped(RegExp(r"&#(\d+);"), (match) {
      int charCode = int.parse(match.group(1)!);
      return String.fromCharCode(charCode);
    });

    return decodedText;
  }
}
