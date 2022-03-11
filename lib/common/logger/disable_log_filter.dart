import 'package:logger/logger.dart';

class DisableLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return false;
  }
}
