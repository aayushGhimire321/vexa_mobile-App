class Failure {
  final String message;
  final int? statusCode;
  Failure({
    required this.message,
    this.statusCode,
  });

  @override
  String toString() => 'Failure(message: $message, statusCode: $statusCode)';
}
class LocalDatabaseFailure extends Failure {
  LocalDatabaseFailure({required String message, int? statusCode})
      : super(message: message, statusCode: statusCode);

  @override
  String toString() => 'LocalDatabaseFailure(message: $message, statusCode: $statusCode)';
}