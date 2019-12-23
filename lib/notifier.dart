

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import 'package:sliver_app_bar/data_manager.dart';
import 'package:sliver_app_bar/data_model.dart';
import 'package:sliver_app_bar/db_manger.dart';


class BookingsDataChangeNotifier extends ChangeNotifier {
  List<Booking> _bookingsData=new List<Booking>();
  List<Booking> bookingsFromServer=new List<Booking>();
  List<Booking> cachedBookings=new List<Booking>();
  List get storeBookingsData=>_bookingsData;
  int store;
  bool _toggle=false;
  bool get toggle=>_toggle;
  int get Store=>store;


  Future getApi(int storeId,bool getData) async
  {
    store=storeId;
    _toggle=!_toggle;
    notifyListeners();
    cachedBookings = await BookingsManager().getAllBookingsFromCache(storeId);
    if(cachedBookings == null || cachedBookings.isEmpty || getData){
      print("from server");
      http.Response response= await http.get(Uri.encodeFull("https://mobile.bookjoy.me/index.php/API_User/api_get_json_dump_by_store/${storeId}"),
          headers: {
            "Accept":"application/json"
          }

      );
      var parsedData=json.decode(response.body)['result'];
      bookingsFromServer = bookingFromJson(json.encode(parsedData));
      var save=BookingsDBManager().saveBookings(bookingsFromServer);
      print("save $save");
      _bookingsData = bookingsFromServer;
    }else{
      _bookingsData = cachedBookings;
    }
    print('DATA IS UPDATED   ${bookingsFromServer}');
    _toggle=!_toggle;
    notifyListeners();
  }

  Future deleteRecord(String custId,int storeId) async{
   int deletedRowCount = await BookingsDBManager().clearBookingsByCustomerId(custId);
   cachedBookings = await BookingsManager().getAllBookingsFromCache(storeId);
   _bookingsData = cachedBookings;
   notifyListeners();

  }
// This call tells the widgets that are listening to this model to rebuild.
}
