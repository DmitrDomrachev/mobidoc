/// A class that adds data states.
sealed class Result<T> {}

/// Successful state that provides the value.
class Success<T> extends Result<T> {
  /// @nodoc.
  final T value;

  /// Create an instance [Success].
  Success(this.value);
}

/// Loading state.
class Loading<T> extends Result<T> {}

/// Error state that provides the exception.
class Error<T> extends Result<T> {
  /// @nodoc.
  final Exception exception;

  /// Create an instance [Error].
  Error(this.exception);
}
