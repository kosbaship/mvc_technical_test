import 'exceptions/exceptions.dart';

sealed class Result<S> {
  const Result();
}


final class Success<S> extends Result<S> {
  const Success(this.value);
  final S value;
}


final class Failure<S> extends Result<S> {
  const Failure(this.exception,{required this.message});
  final AppException exception;
final String? message;
}