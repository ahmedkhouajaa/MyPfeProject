import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:planet/signup_screen.dart';
import 'package:planet/switchscree.dart';

class AddNewPartener extends StatefulWidget {
  const AddNewPartener({Key? key}) : super(key: key);

  @override
  State<AddNewPartener> createState() => _AddNewPartenerState();
}

class _AddNewPartenerState extends State<AddNewPartener> {
  GlobalKey<FormState> redhawk = new GlobalKey<FormState>();
  File? file;
  var fullame, email, red;
  CollectionReference additem =
      FirebaseFirestore.instance.collection("New Items");

  

  valese(context) async {
    var formdata = redhawk.currentState;
    if (formdata!.validate()) {
      formdata.save();
      

    
      
      await additem.add({
        "full name": fullame,
        "email": email,
       
      });
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignUp()));
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar( 
        backgroundColor: Colors.green,
        title: Text("Add New Partner"),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                 Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SwitchScreen()));
              },
            ),
          ],),
        body: Container(width : double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image:AssetImage("images/background.png") )
          ),
          child: Form(
              key: redhawk,
              child: Column(children: [
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: TextFormField(
              maxLength: 30,
              // obscureText: true,
              onSaved: (val) {
                fullame = val;
              },
              validator: ((val) {
                if (val!.length > 100) {
                  return "passs is heih";
                }
                if (val.length < 4) {
                  return "pass is weak";
                }
              }),
        
              decoration: InputDecoration(
                fillColor: Colors.grey.shade100,
                filled: true,
                hintText: 'Full Name',
                labelText: "Full Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: TextFormField(
              keyboardType: TextInputType.phone,
              minLines: 1,
              maxLines: 3,
              onSaved: (val) {
                email= val;
              },
              validator: ((val) {
                if (val!.length > 100) {
                  return "passs is heigh";
                }
                if (val.length < 4) {
                  return "pass is weak";
                }
              }),
              decoration: InputDecoration(
                fillColor: Colors.grey.shade100,
                filled: true,
                hintText: 'partener email',
                labelText: 'partener email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 45,
          ),
          
          SizedBox(
            width: 130,
            child: RoundedButton(
              buttonColor: Colors.green,
              onPressed: () async {
               await valese(context);
              },
              title: " Add Partener",
            ),
          ),
               
              ]),
            ),
        ));
  }
}