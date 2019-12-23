import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliver_app_bar/data_manager.dart';
import 'package:sliver_app_bar/notifier.dart';


class MyHomePage2 extends StatefulWidget {


  @override
  _MyHomePage2State createState() => _MyHomePage2State();
}



class _MyHomePage2State extends State<MyHomePage2> {

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
            title:Text('second page')
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

                      BookingsManager().getBookingsDataFromServer(context,count);

                    },child: Text('Change Store'),),
                    Text('Store Number ${data.store}'),
                  ],),
                Expanded(
                  child: ListView.builder(
                      itemCount: data.data.length,
                      itemBuilder: (BuildContext context,int index)
                      {
                        return Text('This is Name ${data.data[index].firstname}');
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