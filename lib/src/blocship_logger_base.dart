import 'level.dart';
import 'log_event.dart';
import 'log_output.dart';

class Logger {
  List<LogOutput> delegates;

  Logger({
    List<LogOutput>? delegates,
  }) : delegates = [DeveloperConsoleOutput(), ...?delegates];

  void log(
    dynamic message, {
    dynamic error,
    StackTrace? stackTrace,
    Level level = Level.verbose,
  }) {
    var logEvent = LogEvent(level, message, error, stackTrace);
    for (final output in delegates) {
      output.log(logEvent);
    }
  }
}

final logger = Logger();

void Function(String, {dynamic error, StackTrace? stackTrace}) debudlog = (
  String message, {
  dynamic error,
  StackTrace? stackTrace,
}) =>
    logger.log(
      message,
      error: error,
      stackTrace: stackTrace,
      level: Level.debug,
    );
