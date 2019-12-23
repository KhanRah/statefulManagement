

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import 'package:sliver_app_bar/data_manager.dart';
import 'package:sliver_app_bar/data_model.dart';
import 'package:sliver_app_bar/db_manger.dart';


class DataModel extends ChangeNotifier {
  List<Booking> _data=new List<Booking>();
  List<Booking> allBookings=new List<Booking>();
  List<Booking> cachedBookings=new List<Booking>();
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
    cachedBookings = await BookingsManager().getAllBookingsFromCache(storeId);
    if(cachedBookings == null || cachedBookings.isEmpty){
      http.Response response= await http.get(Uri.encodeFull("https://mobile.bookjoy.me/index.php/API_User/api_get_json_dump_by_store/${storeId}"),
          headers: {
            "Accept":"application/json"
          }

      );
      var parsedData=json.decode(response.body)['result'];
      allBookings = bookingFromJson(json.encode(parsedData));
      var save=BookingsDBManager().saveBookings(allBookings);
      print("save $save");
      _data = allBookings;
    }else{
      _data = cachedBookings;
    }
    print('DATA IS UPDATED   ${allBookings}');
    _toggle=!_toggle;
    notifyListeners();
  }
// This call tells the widgets that are listening to this model to rebuild.
}
