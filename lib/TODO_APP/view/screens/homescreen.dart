import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo/TODO_APP/model/services/firebase_services.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
   bool isChecked = false;
   TextEditingController titlecontroller =TextEditingController();
   TextEditingController desccontroller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

       backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Todo",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFFE3F2FD),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
               FirebaseServices().signout();
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              ))
        ],
      ),

      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('user').snapshots(),
        builder: (context, snapshot) {
          final doc = snapshot.data?.docs;
          if(doc==null||doc.isEmpty){
              return Center(child: Text('No datas found'),);
          }

          return SafeArea(child: Column(
            children: [
              Expanded(
                child:ListView.builder(
                  itemCount: doc.length,
                  itemBuilder: (context, index) {
                    final indexed = doc[index];
                  return Card(
                    
                    child: ListTile(
                      
                      title: Text(indexed['title']),
                      subtitle: Text(indexed['desc']),
                      leading: Checkbox(
                        
                        value: indexed['checkbox'], onChanged: (value)async{
                       await FirebaseFirestore.instance.collection('user').doc(indexed.id).update({'checkbox':value});  
                                           }),
                        trailing: Row(mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(onPressed: (){
                              titlecontroller.text = indexed["title"];
                              desccontroller.text = indexed["desc"];
                               showDialog(context: context, builder: (context) {
          return AlertDialog(
            backgroundColor: Color(0xFFE3F2FD),
            title: Text("edit  task"),
            actions: [
              TextButton(onPressed: (){
                FirestoreServices().updateData(titlecontroller.text, desccontroller.text, indexed.id);
                titlecontroller.clear();
                desccontroller.clear();
                Navigator.pop(context);
                

              }, child: Text("ok",style: TextStyle(fontSize: 18),)),
              TextButton(onPressed: (){
                Navigator.pop(context);
                  titlecontroller.clear();
                desccontroller.clear();
              }, child: Text("cancel",style: TextStyle(fontSize: 18),))
            ],
            content: Column(mainAxisSize: MainAxisSize.min,
              children: [
                
              TextFormField(
                controller: titlecontroller,
                decoration: InputDecoration(
                  hintText: "title",
                ),
              ),
              TextFormField(
                controller: desccontroller,
                decoration: InputDecoration(
                  hintText: "description",
                ),
              ),
              SizedBox(height: 3,),
              
             
            ],),
          );
        },);
                            }, icon: Icon(Icons.edit)),
                            IconButton(onPressed: (){
                              FirestoreServices().deletedata(indexed.id);
                            }, icon: Icon(Icons.delete)),

                          ],
                        ),  
                    ),
                  );
                },)
                 )
            ],
          ));
        }
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showDialog(context: context, builder: (context) {
          return AlertDialog(
            backgroundColor: Color(0xFFE3F2FD),
            title: Text("add a task"),
            actions: [
              TextButton(onPressed: (){
                FirestoreServices().createData(titlecontroller.text,desccontroller.text);
                titlecontroller.clear();
                desccontroller.clear();
                Navigator.pop(context);
                

              }, child: Text("ok",style: TextStyle(fontSize: 18),)),
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("cancel",style: TextStyle(fontSize: 18),))
            ],
            content: Column(mainAxisSize: MainAxisSize.min,
              children: [
                
              TextFormField(
                controller: titlecontroller,
                decoration: InputDecoration(
                  hintText: "title",
                ),
              ),
              TextFormField(
                controller: desccontroller,
                decoration: InputDecoration(
                  hintText: "description",
                ),
              ),
              SizedBox(height: 3,),
              
             
            ],),
          );
        },);
      },
      child: Icon(Icons.add),
      backgroundColor: Color(0xFFE3F2FD),
      ),
    );
  }
}