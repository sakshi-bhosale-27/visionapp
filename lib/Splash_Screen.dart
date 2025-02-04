import 'package:flutter/material.dart';
import 'Login_Screen.dart';

class Splash_Screen extends StatefulWidget{

  const Splash_Screen({super.key});
  @override
  State createState() => _SplashScreenState();

}
class _SplashScreenState extends State{


@override
  Widget build(BuildContext context){

    return Scaffold(

      body:
      Center(
        child:
        Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
              const Spacer(),

              GestureDetector(
                onTap: () {
                   Navigator.push<void>(
                    context,MaterialPageRoute<void>(
                                builder: (BuildContext context) => const Login_Screen(),
                            ),
                          );
                },
             

              child:Container(
                height:140,
                width:144,
                
                decoration:
                const BoxDecoration(
                  shape: BoxShape.circle,
                color:Color.fromRGBO(155, 149, 195, 1),
          
                ),
                child:Image.asset("assets/visionlogo.jpg")
                 ),
              ),
              const Spacer(),

          
                 
          
                 const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text("Eye Care Point",
                     style: TextStyle(color: Colors.black,
                     fontWeight: FontWeight.bold,
                     fontSize: 25,
                     ),
                     ),
                   ],
                 )
          ],
          ),
        )
      )
    );
  }
}