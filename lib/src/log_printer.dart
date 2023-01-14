import 'dart:convert';

import 'level.dart';
import 'log_event.dart';

abstract class LogPrinter {
  void init() {}
  List<String> log(LogEvent event);
  void destroy() {}
}

class ConsolePrinter extends LogPrinter {
  static const Map<Level, String> _levelEmojis = {
    Level.verbose: '🌸  VERBOSE — ',
    Level.debug: '🐛  DEBUG   — ',
    Level.info: '💡  INFO    — ',
    Level.warning: '👊🏻  WARNING — ',
    Level.error: '⛔  ERROR   — ',
    Level.wtf: '👾  WTF     — ',
  };

  String stringifyMessage(dynamic message) {
    if (message is Map || message is Iterable) {
      const encoder = JsonEncoder.withIndent('  ');
      return encoder.convert(message);
    } else {
      return message.toString();
    }
  }

  @override
  List<String> log(LogEvent event) {
    final List<String> buffer = [];
    buffer.add(_levelEmojis[event.level]! + stringifyMessage(event.message));
    if (event.error != null) buffer.add(event.error.toString());
    if (event.stackTrace != null) buffer.add(event.stackTrace.toString());
    buffer.add('—————————————————————————————————————————————————————————');
    return buffer;
  }
}
