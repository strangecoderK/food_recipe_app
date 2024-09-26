import 'package:flutter/services.dart';

class CopyLinkUseCase {
  void execute(String text) async {
    Clipboard.setData(ClipboardData(text: text));
  }
}
