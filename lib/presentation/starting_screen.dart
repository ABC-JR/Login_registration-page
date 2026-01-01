import 'package:flutter/material.dart';
import 'package:login_register_app/presentation/LoginPage/login_screen.dart';

class StartingScreen extends StatefulWidget {
  const StartingScreen({super.key});

  @override
  State<StartingScreen> createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
    
      child: Scaffold(
      
        body: Center(
          child: Stack(
            children: [
              Image.network(
                "https://static.vecteezy.com/system/resources/thumbnails/053/324/076/small_2x/abstract-round-circle-light-and-dark-blue-color-gradient-background-vector.jpg",
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),

              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox() ,

                    Center(
                      child: 
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                                Text(
                      "Welcome Back!",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                       fontSize: 25),
                    ),
                    SizedBox(height: 10),

                    Text(
                      "Enter personal details to you employee account",
                      style: TextStyle(color: Colors.white, 
                      fontSize: 15  ,   
                      fontWeight: FontWeight.w400 ,
                      ),
                    ),
                        ],
                      )
                      
                    ) ,
                    Padding(padding: EdgeInsetsGeometry.all(10) ,
                      child: 
                    
                    SizedBox(
                      width: double.infinity,
                      child: 
                    
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shadowColor: Colors.blue  ,
                        foregroundColor: Colors.blue , 
                        backgroundColor: Colors.transparent ,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(20.0)
                        ) ,
                        elevation: 8                        
                      ),
                      onPressed:(){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context)=> LoginScreen()
                        ));
                      } , 

                       child: Text("Get Start")
                       )
                    )
                    ) 
                                   
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
