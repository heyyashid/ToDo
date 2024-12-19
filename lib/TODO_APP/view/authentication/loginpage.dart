
import 'package:flutter/material.dart';
import 'package:todo/TODO_APP/model/services/firebase_services.dart';
import 'package:todo/TODO_APP/view/authentication/registerpage.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
  }

class _LoginpageState extends State<Loginpage> {
final TextEditingController namecontroller=TextEditingController();
final TextEditingController passcontroller=TextEditingController();

  final formkey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        

      // backgroundColor: Colors.green.shade100,
       backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                const SizedBox(height: 60,),
                const Text("Login",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                  
                ),),
                const SizedBox(height: 40,),
                CircleAvatar(radius: 95,
                
                backgroundColor: Colors.white,
                child: Image.asset("assets/todologin.jpg",),),
                
                const SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: namecontroller,
                    decoration: InputDecoration(
                      
                      hintText: "username",
                      prefixIcon: const Icon(Icons.person_2_outlined),
                      
                      fillColor: Color(0xFFE3F2FD),
                      filled: true,
                      border: OutlineInputBorder(
                        // borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                        
                      )
                    ),
                    validator: (value) {
                      if(namecontroller.text.isEmpty){
                        return "enter your username";}
                        return null;
                      
                    },
                  ),
                  
                ),
                const SizedBox(height: 20,),
                
            
                 Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: passcontroller,
                    decoration: InputDecoration(
                      
                      prefixIcon: const Icon(Icons.lock_outline),
                      hintText: "passoword",
                      
                      fillColor: Color(0xFFE3F2FD),
                      filled: true,
                      border: OutlineInputBorder(
                        // borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8)
                      )
                    ),
                    validator: (value) {
                      if(passcontroller.text.isEmpty){
                        return "enter your password";}
                        return null;
                  }),

                  
                ),
                Text("OR"),
              Container(
                height: 50,
                child: MaterialButton(
                
                  onPressed: (){},
                child: Image.asset("assets/google.png",),
                
                ),
              ),
                const SizedBox(height: 30,),
                SizedBox(
                  height: 40,
                  width: 140,
                  child: ElevatedButton(onPressed: ()async{
                    if(formkey.currentState!.validate()){
                      await FirebaseServices().signin(namecontroller.text, passcontroller.text,context);

                     
                    }},
                    
                  
                  style: ElevatedButton.styleFrom(
                            backgroundColor:  Colors.blueGrey,
                            shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)
                                            )
                                            
                                          ),
                  
                   child: const Text("Login",style: TextStyle(
                    color: Colors.white
                   ),)),
                ),
                // SizedBox(height: 10,),
                TextButton(onPressed: (){},
                 child: const Text("Forgot Password",style: TextStyle(
                  fontSize: 13,
                  color: Colors.blue
                 ),)),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     
                       const Text("Doesn't have an account?",style: TextStyle(
                        fontSize: 13,
                        color: Colors.blue
                      ),),
                      TextButton(onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder:((_)=>RegisterPage()) ));
                      }, 
                      child: const Text("Register",style: TextStyle(
                        fontSize: 13,
                        color: Colors.blue
                      ),))
                   ],
                 )
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}
