///
/// Add a [char] at a [position] with the given String [s].
///
/// If [position] is greater than the length of [s], it will return [s].
/// If [repeat] is true and [position] is 0, it will return [s].
///
/// Example :
/// 1234567890 , '-', 3 => 123-4567890
/// 1234567890 , '-', 3, true => 123-456-789-0
///  Based on code from https://github.com/Ephenodrom/Dart-Basic-Utils/blob/master/lib/src/StringUtils.dart
///
extension AddCharAtPosition on String {
  String addCharAtPosition(String char, int position) {
    if (position == 0) {
      return this;
    }
    var buffer = StringBuffer();
    for (var i = 0; i < length; i++) {
      if (i != 0 && i % position == 0) {
        buffer.write(char);
      }
      buffer.write(String.fromCharCode(runes.elementAt(i)));
    }
    return buffer.toString();
  }
}
