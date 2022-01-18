class LoginState {
  final String email, password;
  final bool loading;

  LoginState({
    required this.email,
    required this.password,
    required this.loading,
  });

  static LoginState get initialState => LoginState(
        email: '',
        password: '',
        loading: false,
      );

  LoginState copyWith({
    String? email,
    String? password,
    bool? loading,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      loading: loading ?? this.loading,
    );
  }
}
