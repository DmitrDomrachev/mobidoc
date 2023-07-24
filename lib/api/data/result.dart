sealed class Result<T> {}

class Success<T> extends Result<T> {
  final T value;

  Success(this.value);
}

class Loading<T> extends Result<T> {}

class Error<T> extends Result<T> {
  final Exception exception;

  Error(this.exception);
}
