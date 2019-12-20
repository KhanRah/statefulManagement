import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart'as http;
void main() => runApp(
//  ChangeNotifierProvider(
//    builder: (context)=>DataModel(),
//    child:
MyApp() ,
//  )
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>DataModel(),)
      ],
      child: Consumer<DataModel>(
        builder: (context,data,_)
        {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: MyHomePage(title: 'Flutter Demo Home Page'),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class DataModel extends ChangeNotifier {
  List _data=new List();
  List get data=>_data;
  int store;
  bool _toggle=false;
  bool get toggle=>_toggle;
  int get Store=>store;

  Future getApi(int storeId) async
  {
    store=storeId;
    _toggle=!_toggle;
    notifyListeners();
    http.Response response= await http.get(Uri.encodeFull("https://mobile.bookjoy.me/index.php/API_User/api_get_json_dump_by_store/${storeId}"),
        headers: {
          "Accept":"application/json"
        }

    );

    _data=json.decode(response.body)['result'];
    print('DATA IS UPDATED   ${_data}');
    _toggle=!_toggle;
    notifyListeners();
  }
// This call tells the widgets that are listening to this model to rebuild.
}

class _MyHomePageState extends State<MyHomePage> {

@override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    Timer(Duration(seconds: 3), (){method();});
//  }
//
//  method()
//  {
//  }
  int count=0;


  @override
  Widget build(BuildContext context) {
    final data=Provider.of<DataModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
      body:Stack(
        children: <Widget>[
          Positioned(
             left: 180,
              top: 280,
              child:data.toggle? Center(child:Container(
                height: 100,
                  width: 100,
                  color: Colors.blue,child: CupertinoActivityIndicator())):Container()),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RaisedButton(onPressed: (){
                    count++;

                    Provider.of<DataModel>(context).getApi(count%2==0?5:14);

                  },child: Text('Change Store'),),
                  Text('Store Number ${data.store}'),
                ],),
              Expanded(
                child: ListView.builder(
                    itemCount: data.data.length,
                    itemBuilder: (BuildContext context,int index)
                    {
                      return Text('This is Name ${data.data[index]['firstname']}');
                    }),
              )
            ],
          )
        ],
      )
//      data.data.isEmpty?Text('Load'):

//      Consumer<DataModel>(builder: (context,data,child)
//      {
//        ;
//      }),

    );
  }
}

