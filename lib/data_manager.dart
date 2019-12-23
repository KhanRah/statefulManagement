
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sliver_app_bar/db_manger.dart';
import 'package:sliver_app_bar/notifier.dart';

import 'data_model.dart';

class BookingsManager {

//  ApiResult apiResult;
  List<Booking> allBookings;
  static final BookingsManager _bookingsManagerInstance =
  new BookingsManager.internal();

  BookingsManager.internal();

  factory BookingsManager() => _bookingsManagerInstance;

  Future<List<Booking>> getBookingsDataFromServer(BuildContext context,int count) async{
//    if(allBookings!=null) allBookings.clear();
    int stroeId = count%2==0?5:14;

       Provider.of<DataModel>(context).getApi(stroeId);

  }

  getAllBookingsFromCache(int storeId) async{
    print("<===========CacheData Called On Demand=============>");
    var bookings = await BookingsDBManager().getBookings(storeId.toString());
    print("cached data $bookings");
    return bookings;
  }
  getBookingsFromCacheByDate(String storeId,String date){
    return BookingsDBManager().getBookingsByDate(storeId,date);
  }
  void clearDatabase() {
    BookingsDBManager().clearBookings();
  }
}
