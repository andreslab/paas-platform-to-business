import 'package:flutter/material.dart';
import 'package:paas/providers/client_bar.dart';
import 'package:provider/provider.dart';
import '../api/client.dart';

class ClientMainWidget extends StatefulWidget {
  /* final int clientCount;

  const ClientMainWidget({Key key, this.clientCount}): super(key: key);
 */
  @override
  _ClientMainWidgetState createState() => _ClientMainWidgetState();
}

class _ClientMainWidgetState extends State<ClientMainWidget> {
  final _clientAPI = ClientAPI();
  var clientCount = 0;

  _loadClient() async {
    //call request
    final res = await _clientAPI.getManagerByBusiness(context);

    if (res != null) {
      print("OK");
      setState(() {
        clientCount = res.length;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _loadClient();

    final clientInfo = Provider.of<ClientBar>(context);

    Widget clientDetail = Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(
          children: <Widget>[
            FadeInImage.assetNetwork(
                width: 300,
                height: 300,
                placeholder: "res/img/img_client.png",
                image: "https://img.icons8.com/dusk/2x/google-logo--v1.png"),
            /*Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("res/img/img_bg_ad_slide.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),*/
            Text(
              "Nombre de empresa",
              style: TextStyle(fontSize: 25),
            )
          ],
        ),
        Text(
          "Módulos",
          style: TextStyle(fontSize: 20),
        ),
        Wrap(
          spacing: 0.0, // gap between adjacent chips
          runSpacing: 0.0, // gap between lines
          children: <Widget>[
            module("modulo1", true),
            module("modulo2", true),
            module("modulo3", true),
            module("modulo4", false),
            module("modulo5", false),
            module("modulo6", true),
            module("modulo7", true),
            module("modulo8", false),
          ],
        ),
        /*Container(
          child: Expanded(
              child: GridView.builder(
                  itemCount: 5,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Modulo"),
                        Checkbox(
                          value: true,
                          onChanged: (bool value) {
                            /*setState(() {
                                isActiveModule = value;
                              });*/
                            print("...");
                          },
                        ),
                      ],
                    );
                  })))*/
      ]),
    );

    Widget clientGrid = GridView.builder(
        itemCount: clientCount,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
        itemBuilder: (BuildContext context, int index) {
          return new GestureDetector(
            child: new Card(
              elevation: 5.0,
              child: new Container(
                  alignment: Alignment.center,
                  child: Center(
                    child: Stack(children: [
                      Placeholder(
                        fallbackHeight: 50,
                        fallbackWidth: 50,
                      ),
                      Text('Item $index'),
                    ]),
                  )),
            ),
            onTap: () {
              /*showDialog(
                barrierDismissible: false,
                context: context,
                child: new CupertinoAlertDialog(
                  title: new Column(
                    children: <Widget>[
                      new Text("GridView"),
                      new Icon(
                        Icons.favorite,
                        color: Colors.green,
                      ),
                    ],
                  ),
                  content: new Text("Selected Item $index"),
                  actions: <Widget>[
                    new FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: new Text("OK"))
                  ],
                ),
              );*/
              Navigator.pushNamed(context, "detail");
            },
          );
        });

    List<Widget> pages = [
      PageView(
        children: <Widget>[clientGrid, clientDetail],
      ),
      Container(
        child: Text("Pagina 1"),
      ),
      Container(
        child: Text("Pagina 2"),
      ),
    ];

    return Container(color: Colors.white, child: pages[clientInfo.indexPage]);
  }

  Widget module(String label, bool isActive) => Container(
          child: Row(
        children: <Widget>[
          Text(label),
          Checkbox(
            value: isActive,
            onChanged: (bool value) {
              /*setState(() {
                                isActiveModule = value;
                              });*/
              print("...");
            },
          )
        ],
      ));
}
