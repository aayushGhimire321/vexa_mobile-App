class LoginState {
  final bool isLoading;
  final bool isSuccess;
  final String errorMessage;

  LoginState({
    required this.isLoading,
    required this.isSuccess,
    required this.errorMessage,
  });

  factory LoginState.initial() {
    return LoginState(isLoading: false, isSuccess: false, errorMessage: "");
  }

  LoginState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LoginState &&
        other.isLoading == isLoading &&
        other.isSuccess == isSuccess &&
        other.errorMessage == errorMessage;
  }

  @override
  int get hashCode => isLoading.hashCode ^ isSuccess.hashCode ^ errorMessage.hashCode;

  @override
  String toString() {
    return 'LoginState(isLoading: $isLoading, isSuccess: $isSuccess, errorMessage: $errorMessage)';
  }
}
