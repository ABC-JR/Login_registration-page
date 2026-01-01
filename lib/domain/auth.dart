import 'package:login_register_app/data/UserAuth.dart';

abstract class Auth {
  Future<Userauth> usersignin(String email , String password);
  Future<Userauth> usersignup(String email , String password);
  Future<void> signOut();


}