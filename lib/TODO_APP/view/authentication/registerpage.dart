import 'package:flutter/material.dart';
import 'package:todo/TODO_APP/view/authentication/loginpage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController namecontroller =TextEditingController();
  final TextEditingController passcontroller =TextEditingController();
  final TextEditingController confirmpasscontroller =TextEditingController();

  
  final formkey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 60,),
              const Text("Register",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black
                
              ),),
              const SizedBox(height: 40,),
              CircleAvatar(radius: 85,
              backgroundColor: Colors.white,
              child: Image.asset("assets/register.png"),),
              
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
                     
                      borderRadius: BorderRadius.circular(8)
                    )
                  ),
                  validator: (value) {
                    if(passcontroller.text.isEmpty){
                      return "enter your password";}
                      return null;
                }),
                
              ),
                
              SizedBox(height: 20,),
              
          
               Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: confirmpasscontroller,
                  decoration: InputDecoration(
                    
                    prefixIcon: const Icon(Icons.lock_outline),
                    hintText: "confirm password",
                    
                    fillColor: Color(0xFFE3F2FD),
                    filled: true,
                    border: OutlineInputBorder(
                     
                      borderRadius: BorderRadius.circular(8)
                    )
                  ),
                  validator: (value) {
                    if(confirmpasscontroller.text.isEmpty){
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
                child: ElevatedButton(onPressed:(){},
                //  ()async{
                //   if(formkey.currentState!.validate()){
                //    if(passcontroller.text == confirmpasscontroller.text){
                //      await FirebaseServices().signup(namecontroller.text, passcontroller.text);
                //      Navigator.pop(context);
                //    }
                    
                
                //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                //       content:Text("Register Succefull"),
                //       backgroundColor: Colors.purple,
                
                //        ));
                //   }
                         
                // },
                style: ElevatedButton.styleFrom(
                          backgroundColor:  Colors.blueGrey,
                          shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                                          )
                                          
                                        ),
                
                 child: const Text("Register",style: TextStyle(
                  color: Colors.white
                 ),)),
              ),
              // SizedBox(height: 10,),
            
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   
                     const Text("Already have an account?",style: TextStyle(
                      fontSize: 13,
                      color: Colors.blue
                    ),),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder:((_)=>Loginpage()) ));
                    }, 
                    child: const Text("Login",style: TextStyle(
                      fontSize: 13,
                      color: Colors.blue
                    ),))
                 ],
               )
          
            ],
          ),
        ),
      ),
    );
  }
}