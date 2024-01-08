import 'package:html/parser.dart';

class TextHelper {
  static String htmlToPlainText(String htmlString) {
    final document = parse(htmlString);
    return parse(document.body!.text).documentElement!.text;
  }
}
