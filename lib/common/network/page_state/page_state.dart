import '../exceptions/exceptions.dart';

sealed class PageState<S> {
  const PageState();

  bool get isLoaded {
    return this is Loaded;
  }

  S? get getDataWhenLoaded {
    if (isLoaded) {
      return this as S;
    }
    return null;
  }
}

final class Loaded<S> extends PageState<S> {
  const Loaded(this.value);

  final S value;
}

final class Initial<S> extends PageState<S> {
  const Initial();
}

final class Loading<S> extends PageState<S> {
  const Loading();
}

final class Error<S> extends PageState<S> {
  const Error({required this.exception, required this.message});

  final AppException exception;
  final String? message;
}
