import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Historiques extends StatelessWidget {
  final notess;
  final docids;
  Historiques({this.notess, this.docids});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        
        appBar: AppBar(
          title: const Text('NewComand'),
          backgroundColor: Colors.green,
            actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                
              },
            ),
          ],
        ),
        body: Container(
            child: FutureBuilder<QuerySnapshot>(
                future: FirebaseFirestore.instance
                    .collection("NewComand")
                    .get(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      reverse: true,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: ((context, index) {
                          return Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE64A19),
                                  borderRadius: BorderRadius.circular(13),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 10,
                                        spreadRadius: 3,
                                        offset: Offset(3, 4))
                                  ],
                                ),
                                child: Column(
                                    
                                            
                                             
                                  children: [
                                         Padding(
                                           padding: const EdgeInsets.only(left: 50, right: 30),
                                           child: Row(
                                             children: [
                                               Column(
                                                
                                                
                                               ),
                                               SizedBox(width: 50,),
                                              
                                             ],
                                           ),
                                         ),
                                    ListTile(
                                        onTap: () {
                                          // Navigate to Next Details
                                        },
                                       
                                         
                                          
                                        subtitle: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            const SizedBox(height: 10),
                                            const Icon(Icons.person,
                                                color: Colors.black, size: 30),
                                            Text(
                                              "${snapshot.data!.docs[index]['clientName']}",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(height: 10),
                                            const Icon(Icons.phone_android,
                                                color: Colors.black, size: 30),
                                            Text(
                                              "${snapshot.data!.docs[index]['clientaddress']}",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(height: 10),
                                            const Icon(Icons.location_on,
                                                color: Colors.black, size: 30),
                                           Text(
                                              "${snapshot.data!.docs[index]['phoneNumber']}",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(height: 10),
                                            const Icon(Icons.comment,
                                                color: Colors.black, size: 30),
                                            
                                            const SizedBox(height: 10),
                                          ],
                                        )),
                                 ////   if (Text(
                                  //          "${snapshot.data!.docs[index]['calimtitleck1']}") ==
                                //        null)
                               //       Text("data wait")
                               //     else
                                      
                                 
                                      
                                    //     if ( teckrec == null)  Text("redd")
                                    //   else (Text( "${snapshot.data!.docs[index]['clientName']}"))
                                  ],
                                ),
                              ),
                            
                                    
                            ],
                          );
                        }));
                  }
                  return CircularProgressIndicator();
                }))));
  }
}