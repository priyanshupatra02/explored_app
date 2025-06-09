sealed class RegisterUserState {
  const RegisterUserState();
}

class InitialRegisterUserState implements RegisterUserState {
  const InitialRegisterUserState();
}

class RegisteringUserState implements RegisterUserState {
  const RegisteringUserState();
}

class RegisteredUserState implements RegisterUserState {
  const RegisteredUserState();
}

class NotRegisteredUserState implements RegisterUserState {
  const NotRegisteredUserState();
}

class RegisterUserErrorState implements RegisterUserState {
  final String message;

  const RegisterUserErrorState(this.message);

  @override
  bool operator ==(covariant RegisterUserErrorState other) {
    if (identical(this, other)) return true;

    return other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
