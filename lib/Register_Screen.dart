
import "package:flutter/material.dart";
import "package:visionapp/HomePage.dart";
import "Login_Screen.dart";
//import 'package:flutter_signin_button/flutter_signin_button.dart';
class Register_Screen extends StatefulWidget{

  const Register_Screen({super.key});
  @override
  State createState() => _RegisterScreenState();

}
 class _RegisterScreenState extends State {


  TextEditingController name = TextEditingController();
  TextEditingController mobileno = TextEditingController();
    TextEditingController Gmail = TextEditingController();
    TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  @override
  Widget build(BuildContext context){

    return Scaffold( 
      resizeToAvoidBottomInset: false,
      appBar: AppBar(centerTitle: true,
        title: Text("Create your Account",
                       style:TextStyle(color:Colors.deepPurpleAccent,
                       fontSize: 20,
                       fontWeight: FontWeight.bold,
                       ) 
                        ),
        leading:
        IconButton(onPressed: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=> Login_Screen()));
        },
         icon: Icon(Icons.arrow_back_ios)
         )
         ,),
      body:
      Padding(
        padding: const EdgeInsets.all(12),
        child: Column(children: [
        
          //const SizedBox(height: 10,),
            
           // Container(
             // height:60,
              //width:60,
        
             // child: Image.asset("assets/usericon.jpg",)),
                  //const SizedBox(height: 20,),
        
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     // Text("Create your Account",
                  //     //  style:TextStyle(color:Colors.deepPurpleAccent,
                  //     //  fontSize: 20,
                  //     //  fontWeight: FontWeight.bold,
                  //     //  ) 
                  //     //   ),
                  //   ],
                  // ),
                
        
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                  //height:25,
                  
                      
                                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                    color:Colors.white,
                    boxShadow:[
                    
                              BoxShadow( 
                            offset:Offset(1, 2),
                            blurRadius: 8,
                            color: Color.fromRGBO(210, 210, 210, 1),
                            )
                      
                    ],
                    
                   
                  ),
                  child:
                               TextFormField(
                      controller: name,
                      decoration: const InputDecoration(
                         icon:Icon(Icons.person_2_rounded),
                        hintText: "Enter Your Name",
                        hintStyle: TextStyle(color: Color.fromARGB(255, 222, 222, 222)),
                       label:  Text(" Username",
                       style:TextStyle(fontSize: 14)
                       ),
                        border: InputBorder.none,
                      ),
                        
                    ),
                                ),
                ),
                
                    
              
            
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                  //height:60,
                      
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                    color:Colors.white,
                    boxShadow:[
                    
                              BoxShadow( 
                            offset:Offset(1, 2),
                            blurRadius: 8,
                            color: Color.fromRGBO(210, 210, 210, 1),
                            )
                      
                    ],
                    
                   
                  ),
                  child:
               TextFormField(
                      controller: mobileno,
                      decoration: const InputDecoration(
                         icon:Icon(Icons.phone_android_rounded),
                        hintText: "Enter Your Mobile No",
                        hintStyle: TextStyle(color: Color.fromARGB(255, 222, 222, 222)),
                       label:  Text(" Mobile No.",
                       style:TextStyle(fontSize: 14)
                       ),
                        border: InputBorder.none,
                      ),
                        
                    ),
                ),
             ),
                
                    
              
            
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
                  //height:60,
                      
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                    color:Colors.white,
                    boxShadow:[
                    
                              BoxShadow( 
                            offset:Offset(1, 2),
                            blurRadius: 8,
                            color: Color.fromRGBO(210, 210, 210, 1),
                            )
                      
                    ],
                    
                   
                  ),
                  child:
               TextFormField(
                      controller: Gmail,
                      decoration: const InputDecoration(
                        icon:Icon(Icons.mail_outline_rounded),
                        hintText: "Enter Your Gmail",
                        hintStyle: TextStyle(color: Color.fromARGB(255, 222, 222, 222)),
                       label:  Text(" Gmail",
                       style:TextStyle(fontSize: 14)
                       ),
                        border: InputBorder.none,
                      ),
                        
                    ),
                ),
           ),
                
                    
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                  //height:60,
                      
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                    color:Colors.white,
                    boxShadow:[
                    
                              BoxShadow( 
                            offset:Offset(1, 2),
                            blurRadius: 8,
                            color: Color.fromRGBO(210, 210, 210, 1),
                            )
                      
                    ],
                    
                   
                  ),
                  child:
                TextFormField(
                      controller: password,
                      decoration: const InputDecoration(
                        icon:Icon(Icons.password_rounded),
                        hintText: "Enter Your Password",
                     hintStyle: TextStyle(color: Color.fromARGB(255, 222, 222, 222)),
                       label:  Text(" Password",
                       style:TextStyle(fontSize: 14)
                       ),
                        border: InputBorder.none,
                         suffixIcon: Icon(Icons.remove_red_eye_rounded)
                      ),
                        
                    ),
                
                  
                      
                
                           ),
             ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  //height:60,
                      
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                    color:Colors.white,
                    boxShadow:[
                    
                              BoxShadow( 
                            offset:Offset(1, 2),
                            blurRadius: 8,
                            color: Color.fromRGBO(210, 210, 210, 1),
                            )
                      
                    ],
                    
                   
                  ),
                  child:
                TextFormField(
                      controller: confirmpassword,
                      decoration: const InputDecoration(
                        icon:Icon(Icons.password_rounded),
                        hintText: "Confirm Password",
                     hintStyle: TextStyle(color: Color.fromARGB(255, 222, 222, 222)),
                       label:  Text(" Confirm Password",
                       style:TextStyle(fontSize: 14)
                       ),
                        border: InputBorder.none,
                         suffixIcon: Icon(Icons.remove_red_eye_rounded)
                      ),
                        
                    ),
                ),
            ),
                
                    
             
        
          
           
        
               
             Padding(
              padding: const EdgeInsets.all(4),
              child: ElevatedButton(
                onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePageScreen()));
                }, 
              style:const ButtonStyle(
                
              fixedSize:  WidgetStatePropertyAll<Size?>(Size.fromWidth(250),),
              backgroundColor:WidgetStatePropertyAll(Colors.deepPurpleAccent)
        ),
              
              child: const Text (" Sign in",
              
              style:TextStyle(color: Colors.black,
              )),
              ),
            ),
            Row(
          children: [
            Expanded(
        child: Divider(
          color: Colors.grey,
          thickness: 1,
        ),
            ),
            Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          'OR',
          style: TextStyle(color: Colors.black),
        ),
            ),
            Expanded(
        child: Divider(
          color: Colors.grey,
          thickness: 1,
        ),
            ),
          ],
        ),
        
             Padding(
              padding: const EdgeInsets.all(4),
              child: ElevatedButton(onPressed: (){}, 
              style:const ButtonStyle(
                //minimumSize: WidgetStatePropertyAll(Size.fromHeight(30)),
              fixedSize:  WidgetStatePropertyAll<Size?>(Size.fromWidth(250),
             ),
              backgroundColor:WidgetStatePropertyAll(Colors.white)
        ),
              
              child: 
              
               Row(
        
                 children: [
                   SizedBox(
                    height:15,
                    width:15,
                    child: Image.asset("assets/logo_google.png")),
                    SizedBox(width:25),
                    Text("Continue with Google",
                    style:TextStyle(color:Colors.black)
                    )
                 ],
               )
              ),
        
        
            
            ),
            //const SizedBox(height: 10,),
        
        
             Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Login_Screen(),));
                      },
                      child:const Text("Log In"),
                      )
                    ],
                  ),
        
        ],),
      )
    );

  }
 }