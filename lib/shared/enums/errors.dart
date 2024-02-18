enum AuthError {
  weakPassword,
  userAlreadyExists,
  wrongPassword,
}

extension AuthErrorMessagesExtenson on AuthError {
  String get message {
    switch (this) {
      case AuthError.weakPassword:
        return "Слишком слабый пароль.";
      case AuthError.userAlreadyExists:
        return "Пользователь уже существует.";
      case AuthError.wrongPassword:
        return "Неверный пароль.";
      default:
        return "Неизвестная ошибка";
    }
  }
}
