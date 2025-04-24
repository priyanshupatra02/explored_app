sealed class LoginUserState {
  const LoginUserState();
}

class InitialLoginUserState implements LoginUserState {
  const InitialLoginUserState();
}

class LoggingInUserState implements LoginUserState {
  const LoggingInUserState();
}

class LoggedInState implements LoginUserState {
  const LoggedInState();
}

class NotLoggedInUserState implements LoginUserState {
  const NotLoggedInUserState();
}

class LoginUserErrorState implements LoginUserState {
  final String message;

  const LoginUserErrorState(this.message);

  @override
  bool operator ==(covariant LoginUserErrorState other) {
    if (identical(this, other)) return true;

    return other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
