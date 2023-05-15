import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planet/addPoints.dart';




CollectionReference Items =
    FirebaseFirestore.instance.collection("New Items");

class historiqueItesUser extends StatelessWidget {
  historiqueItesUser({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text('Iems Historique'),
          backgroundColor: Color(0xFF5B6960),
        ),
        body: Container(
            child: FutureBuilder<QuerySnapshot>(
                future: Items.get(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: ((context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                              color: const Color(0xFF5B6960),
                              borderRadius: BorderRadius.circular(13),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 10,
                                    spreadRadius: 3,
                                    offset: Offset(3, 4))
                              ],
                            ),
                            child: ListTile(
                              onTap: () {
                                // Navigate to Next Details
                               
                              },
                              trailing: const Icon(Icons.arrow_forward,
                                  color: Colors.black, size: 39),
                                  
                              title: Container(
                                height: 45,
                                child: Text(
                                  "address : ${snapshot.data!.docs[index]['address']}",
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      "full name : ${snapshot.data!.docs[index]['full name']}",
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                 
                                  SizedBox(height: 10,),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      "phone : ${snapshot.data!.docs[index]['phone']}",
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                   SizedBox(height: 10,),
                                  Container(
                                    height: 200,
                                    padding: const EdgeInsets.only(top: 10),
                                     decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Color(0xff707070),
                width: 1,
              ),
              image: DecorationImage(
                  image:NetworkImage("${snapshot.data!.docs[index]['image']}"),fit: BoxFit.fill),
            ),
                                  ),
                                  
                                ],
                              ),
                            ),
                          );
                          
                        }));
                  }
                  return CircularProgressIndicator();
                }))));
  }
}