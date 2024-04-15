
import 'package:flutter_bloc/flutter_bloc.dart';


///Onchange and on onTransition metheods to track every state in the app either for Bloc neither Cubit
class SimpleBlocOpserver extends BlocObserver{

  @override
  void onChange(BlocBase bloc, Change change) {
    // TODO: implement onChange
    super.onChange(bloc, change);
    print(change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
    super.onTransition(bloc, transition);
    print(transition);
  }
}