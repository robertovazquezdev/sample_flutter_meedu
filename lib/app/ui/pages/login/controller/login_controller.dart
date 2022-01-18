import 'package:flutter/foundation.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'login_state.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController() : super(LoginState.initialState) {
    if (kDebugMode) {
      print(':::Instancia creada de LoginController:::');
    }
  }

  void onEmailChanged(String text) {
    /* cuando se modifica el state
    actumaticamente notifica el cambio
    por lo que no se requiere usar notify()
    */
    state = state.copyWith(email: text);
  }

  void onPasswordChanged(String text) {
    state = state.copyWith(password: text);
  }

  Future<void> submit() async {
    state = state.copyWith(loading: true);
    await Future.delayed(
      const Duration(seconds: 1),
    );
    state = state.copyWith(loading: false);
  }
}
