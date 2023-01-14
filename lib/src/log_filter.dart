import 'level.dart';
import 'log_event.dart';

abstract class LogFilter {
  Level? level;
  void init() {}
  bool shouldLog(LogEvent event);
  void destroy() {}
}

class LogAll extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}
