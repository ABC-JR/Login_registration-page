import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_register_app/data/UserAuth.dart';
import 'package:login_register_app/domain/authiml.dart';
import 'package:login_register_app/presentation/LoginPage/bloc/login_event.dart';
import 'package:login_register_app/presentation/LoginPage/bloc/login_state.dart';

class Login_ScreenBloc extends Bloc<Login_ScreenEvent, Login_ScreenState> {
  Login_ScreenBloc() : super(LoginState()) {

    on<LoginIn_bygoogle_event>((event, emit) async {
      User? user = await Authiml(
        firebaseAuth: FirebaseAuth.instance,
      ).signInWithGoogle();
      if (user != null) {
        print("Успешный вход: ${user.email}");
      }


    });

    on<LoginIn_byemail_event>((event, emit) async {
      var auth = Authiml(firebaseAuth: FirebaseAuth.instance);
      Userauth user  =  await auth.usersignin(
        event.email , 
        event.password
      );


       print("Успешный вход: ${user.email}");
      if(user.email == null){
        emit(Login_Error_State());
      }
      
      emit(Login_Succes_State());
       
    
    });
  }


}
