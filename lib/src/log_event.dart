import 'level.dart';

class LogEvent {
  final Level level;
  final dynamic message;
  final dynamic error;
  final StackTrace? stackTrace;

  LogEvent(
    this.level,
    this.message,
    this.error,
    this.stackTrace,
  );
}
