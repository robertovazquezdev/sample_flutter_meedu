import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/state.dart';
import 'package:sample_flutter_meedu/app/ui/pages/login/controller/login_provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              Column(
                children: [
                  TextField(
                    onChanged: loginProvider.read.onEmailChanged,
                    decoration: const InputDecoration(hintText: 'email,'),
                  ),
                  TextField(
                    onChanged: loginProvider.read.onPasswordChanged,
                    decoration: const InputDecoration(
                      hintText: 'password',
                    ),
                  ),
                  ElevatedButton(
                    /*de este modo la instancia de
                    logincontroler se crea al
                    onPressed del usuario
                    */
                    // onPressed: () {
                    //   loginProvider.read.submit();
                    // },
                    /*de este modo la instancia de
                    logincontroler se crea al
                    al momento de renderisara el widget
                    */
                    onPressed: loginProvider.read.submit,
                    child: const Text('SEND'),
                  ),
                  Consumer(
                    builder: (_, ref, __) {
                      /*si el builder no tiene 
                      un watch o select
                      solo se renderiza una sola vez
                      */
                      if (kDebugMode) {
                        print(
                            'Entra a renderizar el texto de email y password:::');
                      }
                      final controller = ref.watch(loginProvider);
                      return Column(
                        children: [
                          Text('email: ${controller.state.email}'),
                          Text('password: ${controller.state.password}'),
                        ],
                      );
                    },
                  ),
                ],
              ),
              Consumer(
                builder: (_, ref, __) {
                  if (kDebugMode) {
                    print('Entra a renderizar el progressIndicator:::');
                  }
                  /*el watch de esta forma
                  nos trae el state completo
                  y se renderiza el consumer cada vez
                  que exista un cambio en el state
                  */
                  //final state = ref.watch(loginProvider).state;

                  /*el watch de esta forma
                  nos trae el loginController
                  y se renderiza el consumer cada vez
                  que cambie el valor loading del state
                  */
                  // final state = ref.watch(
                  //   loginProvider.select((_) => _.loading),
                  // );

                  /*con select de esta forma
                  nos trae el valor de loading
                  y se renderiza el consumer cada vez
                  que cambie el valor loading del state
                  */
                  // final loading = ref.select(
                  //   loginProvider.select((_) => _.loading),
                  // );

                  /*el watch con when sirve para hacer comparacion
                  entre el state previo y el actual
                  y se renderiza el consumer cada vez
                  que se cumple la condicion
                  podes devolver el contraldor 
                  o el state o el valor
                  */
                  final loading = ref
                      .watch(
                        loginProvider.when(
                          (prev, current) {
                            return prev.loading != current.loading;
                          },
                        ),
                      )
                      .state
                      .loading;

                  if (loading) {
                    return Positioned.fill(
                      child: Container(
                        color: Colors.black26,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
