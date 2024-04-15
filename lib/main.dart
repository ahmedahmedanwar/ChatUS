import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat/pages/chat_page.dart';
import 'package:scholar_chat/pages/cubits/auth_cubit/auth_cubit.dart';
import 'package:scholar_chat/pages/cubits/bloc/auth_bloc.dart';
import 'package:scholar_chat/pages/cubits/chat_cubit/chat_cubit.dart';
import 'package:scholar_chat/pages/login_page.dart';
import 'package:scholar_chat/pages/register_page.dart';
import 'package:scholar_chat/simple_bloc_observer.dart';

import 'firebase_options.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
//Run zoned to use the SimpleBlocOpserver class for tracking states and events 
//to the bloc and the cubit 

  BlocOverrides.runZoned(() {
      runApp(const ScholarChat());
  },
  blocObserver: SimpleBlocOpserver(),
  );
 
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => ChatCubit()),
        BlocProvider(create: (context) => AuthBloc()),
      ],
      child: MaterialApp(
        routes: {
         LoginPage.id: (context) => LoginPage(),
          RegisterPage.id: (context) => RegisterPage(),
          ChatPage.id : (context) => ChatPage()
        },
        initialRoute: LoginPage.id,
      ),
    );
  }
}
