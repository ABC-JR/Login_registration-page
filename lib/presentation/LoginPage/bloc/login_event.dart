abstract class Login_ScreenEvent {}


class Load_Login_News implements Login_ScreenEvent{

}


class LoginIn_bygoogle_event implements Login_ScreenEvent{

}

class LoginIn_byemail_event implements Login_ScreenEvent{
  final String email;
  final String password;

  LoginIn_byemail_event({
    required this.email   , 
    required this.password
  });
  
}


