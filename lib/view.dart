import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliver_app_bar/data_manager.dart';
import 'package:sliver_app_bar/notifier.dart';
import 'package:sliver_app_bar/view2.dart';
import 'main.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
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
    final data=Provider.of<BookingsDataChangeNotifier>(context);
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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RaisedButton(onPressed: (){
                        count++;

                        BookingsManager().getBookingsDataFromServer(context,count,false);

                      },child: Text('Change Store'),),
                      RaisedButton(onPressed: (){
                        Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) {
                          return new MyHomePage2();
                        }));

                      },child: Text('Second Page'),),
                      Text('Store Number ${data.store}'),
                    ],),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        itemCount: data.storeBookingsData.length,
                        itemBuilder: (BuildContext context,int index)
                        {
                          return Text('This is Name ${data.storeBookingsData[index].firstname}');
                        }),
                  ),
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