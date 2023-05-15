import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Iteams extends StatefulWidget {
  const Iteams({super.key});

  @override
  State<Iteams> createState() => _IteamsState();
}

class _IteamsState extends State<Iteams> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

body: Center(child: Container(child: Image.asset("images/items.png"),))

    );
  }
}