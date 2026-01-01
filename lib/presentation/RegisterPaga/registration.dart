import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_register_app/domain/authiml.dart';
import 'package:login_register_app/presentation/LoginPage/bloc/login_bloc.dart';
import 'package:login_register_app/presentation/LoginPage/bloc/login_event.dart';
import 'package:login_register_app/presentation/LoginPage/login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email_text = "";
  String password = "";

  bool _isremember = false;
  bool ispresedeye = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
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
                        "Get Started",
                        style: TextStyle(
                          color: Color.fromRGBO(59, 101, 201, 1),
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 15),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          labelText: "Fullname",
                          hintText: "Enter Full Name",
                          fillColor: Colors.blue,
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
                              Row(
                                children: [
                                  Text(
                                    "I agree to the proccessing of",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    "Personal data",
                                    style: TextStyle(
                                      color: Color.fromRGBO(59, 101, 201, 1),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
                            var auth = Authiml(
                              firebaseAuth: FirebaseAuth.instance,
                            );
                            auth.usersignup(email_text, password);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Sign Up",
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
                              User? user = await Authiml(
                                firebaseAuth: FirebaseAuth.instance,
                              ).signInWithGoogle();
                              if (user != null) {
                                print("Успешный вход: ${user.email}");
                              }
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
                        onTap: (){
                           Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account ?",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              "Sign in",
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
        ),
      ),
    );
  }
}
