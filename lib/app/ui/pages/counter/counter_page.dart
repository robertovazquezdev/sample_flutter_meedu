import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/state.dart';
import 'controller/counter_provider.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              counterProvider.read.getDate();
            },
            icon: const Icon(Icons.date_range),
          ),
          IconButton(
            onPressed: () {
              counterProvider.read.getDate2();
            },
            icon: const Icon(Icons.date_range_outlined),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer(
              builder: (_, ref, __) {
                if (kDebugMode) {
                  print('Entra a renderizar el texto del counter (1):::');
                }
                /* watch escucha cada vez que se llama
                al metodo notify() del SimpleNotifier(controller)
                */
                //final c = ref.watch(counterProvider);

                /* watch de esta forma nos sirve
                para renderizar solo cada que una condicion se cumpla
                */
                // final c = ref.watch(
                //   counterProvider.select(
                //     (_) => _.counter >= 5,
                //   ),
                // );

                /* watch de esta forma nos sirve
                para renderizar solo cada el valor cambie
                */
                final c = ref.watch(
                  counterProvider.select(
                    (_) => _.counter,
                  ),
                );
                return Text(
                  '${c.counter}',
                  style: const TextStyle(fontSize: 35),
                );
              },
            ),
            Consumer(
              builder: (_, ref, buttonWidget) {
                if (kDebugMode) {
                  print('Entra a renderizar el texto del counter (2):::');
                }
                /*con select se retorna el valor que retorna
                el select del provider
                */
                final counter = ref.select(
                  counterProvider.select(
                    (_) => _.counter,
                  ),
                );
                return Column(
                  children: [
                    Text(
                      '$counter',
                      style: const TextStyle(fontSize: 35),
                    ),
                    buttonWidget!
                  ],
                );
              },
              /*este child es para poner un widget
              que nunca se va a redenrizar
              aunque el consumer se actulice
              y el widget del child es el tercer parametro
              del builder del consumer
              */
              child: FloatingActionButton(
                  onPressed: counterProvider.read.increment),
            ),
            /*un Consumer puede escuchar cambios de varios providers*/
            Consumer(
              builder: (_, ref, __) {
                if (kDebugMode) {
                  print('Entra a renderizar el texto de la fecha:::');
                }
                final c = ref.watch(
                  counterProvider.select(
                    (_) => _.strDate,
                  ),
                );

                return Text(
                  c.strDate,
                  style: const TextStyle(fontSize: 15),
                );
              },
            ),
            Consumer(
              builder: (_, ref, __) {
                if (kDebugMode) {
                  print(
                      'Entra a renderizar el texto de la fecha en modo ids:::');
                }
                /* watch de esta forma
                actualiza el consumer cuando el notify envie el mismo id
                */
                /*🚧 esta es la teoria pero en la practica
                no esta funcionando de esa manera
                esta haciendo renderizado en cada notify()
                */
                final c = ref.watch(
                  counterProvider.ids(() => ['actDate']),
                );
                return Text(
                  c.strDate2,
                  style: const TextStyle(fontSize: 15),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
