import 'log_event.dart';

/// An abstract filter of log messages.
///
/// You can implement your own `LogFilter` or use [LogAllFliter].
abstract class LogFilter {
  void init() {}
  bool shouldLog(LogEvent event);
  void destroy() {}
}

class LogAllFliter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}
