import 'package:flutter/material.dart';

class RegisterModule extends StatefulWidget {
  @override
  _RegisterModuleState createState() => _RegisterModuleState();
}

class _RegisterModuleState extends State<RegisterModule> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, position) {
          return section;
        },
      ),
    );
  }

  Widget section = Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
      SizedBox(height: 50),
      Text("NOMBRE SECCION", style: TextStyle(fontSize: 20),textAlign: TextAlign.left,),
      SizedBox(height: 5),
      Container(height: 1, color: Colors.grey,),
      SizedBox(height: 5),
      TextFormField(
        decoration: InputDecoration(
            labelText: "Nombre",
            contentPadding: EdgeInsets.symmetric(vertical: 10)),
      ),
      SizedBox(height: 10),
      TextFormField(
        decoration: InputDecoration(
            labelText: "Apellido",
            contentPadding: EdgeInsets.symmetric(vertical: 10)),
      ),
    ]),
  );
}
