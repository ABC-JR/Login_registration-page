import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_register_app/domain/authiml.dart';
import 'package:login_register_app/presentation/LoginPage/bloc/login_bloc.dart';
import 'package:login_register_app/presentation/LoginPage/bloc/login_event.dart';
import 'package:login_register_app/presentation/LoginPage/bloc/login_state.dart';
import 'package:login_register_app/presentation/RegisterPaga/registration.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email_text = "";
  String password = "";

  bool _isremember = false;
  bool ispresedeye = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (_) => Login_ScreenBloc(),
          child: BlocBuilder<Login_ScreenBloc, Login_ScreenState>(
            builder: (context, state) {
              return newMethod(context);
            },
          ),
        ),
      ),
    );
  }

  Stack newMethod(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          "https://static.vecteezy.com/system/resources/thumbnails/053/324/076/small_2x/abstract-round-circle-light-and-dark-blue-color-gradient-background-vector.jpg",
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Align(
          alignment: Alignment.bottomCenter,

          child: Card(
            // color: Colors.transparent,
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 15),
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: Color.fromRGBO(59, 101, 201, 1),
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15),

                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 15),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      labelText: "Email",
                      hintText: "@gmail.com",
                      fillColor: Colors.blue,
                    ),
                    onChanged: (value) {
                      setState(() {
                        email_text = value;
                      });
                    },
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 15),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      labelText: "Password",
                      hintText: "password_123",
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (ispresedeye) {
                              ispresedeye = false;
                            } else {
                              ispresedeye = true;
                            }
                          });
                        },
                        icon: Icon(
                          ispresedeye == true
                              ? Icons.lock_sharp
                              : Icons.no_encryption_gmailerrorred,
                        ),
                      ),
                    ),
                    obscureText: ispresedeye,
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: _isremember,
                            onChanged: (bool? newvalue) {
                              setState(() {
                                _isremember = newvalue ?? false;
                              });
                            },
                            activeColor: Color.fromRGBO(59, 101, 201, 1),
                            checkColor: Colors.grey,
                          ),

                          Text(
                            "Remember me",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(
                            color: Color.fromRGBO(59, 101, 201, 1),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(59, 101, 201, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        context.read<Login_ScreenBloc>().add(
                          LoginIn_byemail_event(
                            email: email_text,
                            password: password,
                          ),
                        );
                      },
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          backgroundColor: Color.fromRGBO(59, 101, 201, 1),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(thickness: 2, color: Colors.grey),
                      ),
                      Padding(padding: EdgeInsetsGeometry.all(5)),
                      Text(
                        "Sign in with",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                      Padding(padding: EdgeInsetsGeometry.all(5)),
                      Expanded(
                        child: Divider(thickness: 2, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          context.read<Login_ScreenBloc>().add(
                            LoginIn_bygoogle_event(),
                          );
                        },
                        child: Image.network(
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1200px-Google_%22G%22_logo.svg.png",
                          fit: BoxFit.fill,
                          height: 37,
                          width: 37,
                        ),
                      ),

                      Image.network(
                        "https://m.media-amazon.com/images/I/31AGs2bX7mL.png",
                        fit: BoxFit.fill,
                        height: 37,
                        width: 37,
                      ),
                      Image.network(
                        "https://play-lh.googleusercontent.com/KCMTYuiTrKom4Vyf0G4foetVOwhKWzNbHWumV73IXexAIy5TTgZipL52WTt8ICL-oIo",
                        fit: BoxFit.fill,
                        height: 37,
                        width: 37,
                      ),
                    ],
                  ),

                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegistrationScreen(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Dont'have an account ?",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "Sign up",
                          style: TextStyle(
                            color: Color.fromRGBO(59, 101, 201, 1),
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
