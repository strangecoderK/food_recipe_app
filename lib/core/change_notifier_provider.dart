import 'package:flutter/material.dart';

class ChangeNotifierProvider<T extends ChangeNotifier> extends InheritedWidget {
  final T value;

  const ChangeNotifierProvider({
    super.key,
    required this.value,
    required super.child,
  });

  static ChangeNotifierProvider<T> of<T extends ChangeNotifier>(
      BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ChangeNotifierProvider<T>>()!;
  }

  @override
  bool updateShouldNotify(covariant ChangeNotifierProvider oldWidget) {
    return value != oldWidget.value;
  }
}
