sealed class UpdateUserState {
  const UpdateUserState();
}

class InitialUpdateUserState implements UpdateUserState {
  const InitialUpdateUserState();
}

class UpdatingUserState implements UpdateUserState {
  const UpdatingUserState();
}

class UpdatedUserState implements UpdateUserState {
  const UpdatedUserState();
}

class NotUpdatedUserState implements UpdateUserState {
  const NotUpdatedUserState();
}

class UpdateUserErrorState implements UpdateUserState {
  final String message;

  const UpdateUserErrorState(this.message);

  @override
  bool operator ==(covariant UpdateUserErrorState other) {
    if (identical(this, other)) return true;

    return other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
