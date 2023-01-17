import 'package:blocship_logger/src/log_event.dart';

import 'log_filter.dart';
import 'log_printer.dart';
import 'output_event.dart';

/// This can be an output stream, a file or a network target or console
/// i.e. [DeveloperConsoleOutput].
/// [LogOutput] may cache multiple log messages.
/// Each output stream has its own [LogFilter] and [LogPrinter]
abstract class LogOutput {
  final LogFilter filter;
  final LogPrinter printer;

  LogOutput({
    required this.filter,
    required this.printer,
  });

  void log(LogEvent logEvent) {
    if (filter.shouldLog(logEvent)) {
      var output = printer.log(logEvent);
      if (output.isNotEmpty) {
        var outputEvent = OutputEvent(logEvent.level, output);
        this.output(outputEvent);
      }
    }
  }

  void init() {}
  void output(OutputEvent event);
  void destroy() {}
}

class DeveloperConsoleOutput extends LogOutput {
  DeveloperConsoleOutput()
      : super(
          filter: LogAllFliter(),
          printer: ConsolePrinter(),
        );

  @override
  void output(OutputEvent event) {
    for (var element in event.lines) {
      print(element);
    }
  }
}
