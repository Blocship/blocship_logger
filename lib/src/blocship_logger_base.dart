import 'level.dart';
import 'log_event.dart';
import 'log_output.dart';

class Logger {
  final List<LogOutput> delegates;

  Logger({
    List<LogOutput>? delegates,
  }) : delegates = [DeveloperConsoleOutput(), ...?delegates];

  Logger.custom({
    required this.delegates,
  });

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
