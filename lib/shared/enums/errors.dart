enum AuthError {
  weakPassword,
  userAlreadyExists,
  wrongPassword,
  noDataProvided,
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
      case AuthError.noDataProvided:
        return "Не введён логин/пароль.";
      default:
        return "Неизвестная ошибка";
    }
  }
}
