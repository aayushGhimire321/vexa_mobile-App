import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../domain/entity/auth_entity.dart';
import '../../../domain/use_case/login_usecase.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginRequested) {
      yield LoginLoading();

      // Call the use case to authenticate the user
      final result = await loginUseCase(
        LoginParams(username: event.username, password: event.password),
      );

      yield* result.fold(
            (failure) async* {
          // Yield a failure state if login fails
          yield LoginFailure(message: failure.message);
        },
            (userId) async* {
          // Assuming userId is returned on successful login, and we fetch user details next.
          final user = await _getUserDetails(userId);  // Example of how to fetch user details.

          // Yield success with the user entity
          yield LoginSuccess(user: user);
        },
      );
    }
  }

  // Example function to fetch user details (you would implement this as per your app's logic)
  Future<UserEntity> _getUserDetails(String userId) async {
    // Simulate fetching user details with the userId
    // You should replace this with actual logic to fetch user data from your repository
    return UserEntity(
      userId: userId,
      username: "exampleUsername",
      email: "example@example.com",
      password: "examplePassword",
      image: "exampleImage",  // Add the actual image path/URL if necessary
    );
  }
}
