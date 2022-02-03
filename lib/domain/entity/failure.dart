import 'package:meta/meta.dart';

class Failure {
  final String message;
  final Exception? exception;
  final StackTrace? stackTrace;

  Failure({
    required this.message,
    this.exception,
    this.stackTrace,
  });


  @override
  String toString() {
    return message;
  }
}
