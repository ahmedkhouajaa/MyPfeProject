import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:planet/counterdown.dart';
import 'package:planet/switchscree.dart';
import 'package:timer_count_down/timer_count_down.dart';

class Command3 extends StatefulWidget {
  const Command3({super.key});

  @override
  State<Command3> createState() => _Command3State();
}

DateTime now = DateTime.now();
String formattedDate =
    '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
String formattedTime =
    '${(now.hour + 1).toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';

var currenttime,
    currentdate,
    clientName,
    clientFirstName,
    clientaddress,
    phoneNumber;
GlobalKey<FormState> _formKey3 = new GlobalKey<FormState>();

CollectionReference newcmmand =
    FirebaseFirestore.instance.collection("NewComand");
newadd3(context) async {
  var formdata = _formKey3.currentState;

  if (formdata!.validate()) {
    formdata.save();
    String ez = '';
    String documentId = '';
    FirebaseFirestore.instance
        .collection('users')
        .where(
          'userId',
          isEqualTo: FirebaseAuth.instance.currentUser!.uid,
        )
        .get()
        .then((QuerySnapshot querySnapshot) async {
      if (querySnapshot.docs.isNotEmpty) {
        documentId = querySnapshot.docs.first.id;
        // Do something with the retrieved document ID
        print('## got doc ID = $documentId');
        querySnapshot.docs.first["Points"];

        int x = int.parse(querySnapshot.docs.first["Points"]);
        if (x < 7500) {
          AwesomeDialog(
              context: context, title: "error", body: Text('solde insuffisant'))
            ..show();
        } else {
          var z = x - 7500;
          String ez = z.toString();
          await FirebaseFirestore.instance
            .collection("users")
            .doc(documentId)
            .update({
          "Points": ez,
        });
        Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => MyHomePage(
                                  title: '',
                                ))));
                                 await newcmmand.add({
    "clientName": clientName,
    "clientFirstName": clientFirstName,
    "clientaddress": clientaddress,
    "phoneNumber": phoneNumber,
    "userId": FirebaseAuth.instance.currentUser!.uid,
    "ProductName" : "Smart Phone"

  });

        }

        /// add your code here
        
        
      }
    });
    
  
  }
 
}

class _Command3State extends State<Command3> {
  get style => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulaire de réclamation'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SwitchScreen(
                            
                          )));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey3,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'nom',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez saisir votre nom';
                  }
                  return null;
                },
                onSaved: (value) {
                  clientName = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'prénom',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez saisir votre prénom';
                  }
                  return null;
                },
                onSaved: (value) {
                  clientFirstName = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Numéro de téléphone fixe ',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez saisir votre numéro de téléphone fixe ';
                  }
                  return null;
                },
                onSaved: (value) {
                  phoneNumber = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'addresse de la client ',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez saisir votre adresse';
                  }
                  return null;
                },
                onSaved: (value) {
                  clientaddress = value!;
                },
              ),
              ElevatedButton(
                onPressed: () async {
                   await newadd3(context);
                  
                },
                child: const Text('valider la Command3'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}