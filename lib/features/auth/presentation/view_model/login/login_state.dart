import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final String? token; // Store the token instead of UserEntity
  final String errorMessage;


  const LoginState( {
    required this.isLoading,
    required this.isSuccess,
    this.token,
    required this.errorMessage,
  });

  factory LoginState.initial() {
    return const LoginState(
      isLoading: false,
      isSuccess: false,
      token: null,
      errorMessage: '',

    );
  }

  LoginState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? token,
    String? errorMessage,

  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      token: token ?? this.token,
      errorMessage: errorMessage ?? this.errorMessage,

    );
  }

  @override
  List<Object?> get props => [isLoading, isSuccess, token, errorMessage];
}
