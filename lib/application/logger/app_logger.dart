import 'package:logger/logger.dart';

final Logger log = Logger(
  printer: PrettyPrinter(
    stackTraceBeginIndex: 0,
    methodCount: 1,
  ),
);
