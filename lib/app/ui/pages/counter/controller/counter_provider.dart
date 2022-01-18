import 'package:flutter_meedu/meedu.dart';
import 'counter_controller.dart';

/*un SimpleProvider no crea una instancia
de la clase que se le pasa,
hasta que se le llama por primera vez
al provider
*/
final counterProvider = SimpleProvider(
  (_) => CounterController(),
);
