import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/utils/client_action_bar.dart';
import '../widgets/client_main.dart';

class ClientPage extends StatefulWidget {
  @override
  _ClientPageState createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ClientActionBarWidget(menu: 1,),
          Expanded(
            child: Container(
              child: ClientMainWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
