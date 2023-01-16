import 'package:blocship_logger/blocship_logger.dart';

final _logger = Logger();

void Function(
  String, {
  dynamic error,
  StackTrace? stackTrace,
  Level level,
}) log = (
  String message, {
  dynamic error,
  StackTrace? stackTrace,
  Level level = Level.verbose,
}) =>
    _logger.log(
      message,
      error: error,
      stackTrace: stackTrace,
      level: level,
    );

class TestException implements Exception {}

void main() {
  try {
    log("This is main test", level: Level.debug);
    throw TestException();
  } catch (e, s) {
    log("This is test error", error: e, stackTrace: s, level: Level.error);
  }
}
