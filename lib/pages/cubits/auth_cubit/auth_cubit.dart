import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

//Register Cubit Function

    Future<void> registerUser({required email, required String password}) async {
    emit(RegisterLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'Weak password') {
        emit(RegisterFailure(errorMessage: 'user-not-found'));
      } else if (ex.code == 'wrong-password') {
        emit(RegisterFailure(errorMessage: 'wrong-password'));
      }
    } catch (ex) {
      // ignore: avoid_print
      print(ex);
    // ignore: dead_code_catch_following_catch
    } on Exception catch (e) {
      emit(RegisterFailure(errorMessage: 'Somthing went wrong'));
    }
    }
    //Login Cubit Function

  Future<void> loginUser({required email, required String password}) async {
    emit(LoginLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-not-found') {
        emit(LoginFailure(errorMessage: 'user-not-found'));
      } else if (ex.code == 'wrong-password') {
        emit(LoginFailure(errorMessage: 'wrong-password'));
      }
    } catch (ex) {
      // ignore: avoid_print
      print(ex);
    // ignore: dead_code_catch_following_catch
    } on Exception catch (e) {
      emit(LoginFailure(errorMessage: 'Somthing went wrong'));
    }
  }




}
