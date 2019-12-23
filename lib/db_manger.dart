import 'dart:async';
import 'package:path/path.dart';
import 'package:sliver_app_bar/data_model.dart';
import 'package:sqflite/sqflite.dart';

class BookingsDBManager{
  static final BookingsDBManager _dataBaseBookingsInstance =
  new BookingsDBManager.internal();

  BookingsDBManager.internal();

  factory BookingsDBManager() => _dataBaseBookingsInstance;

  final String bookingsTable = 'Bookings';

  static Database _bookings;

  Future<Database> get db async {
    if (_bookings != null && _bookings.isOpen) {
      return _bookings;
    }
    _bookings = await initDb();

    return _bookings;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'bookings.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int dbVersion) async {
    await db.execute(
        "CREATE TABLE $bookingsTable(id TEXT PRIMARY KEY, resourceId TEXT,title TEXT,start TEXT, end TEXT, storeid TEXT, servicecode TEXT, serviceName TEXT, serviceDefdur TEXT, servicePrebuff TEXT, servicePostbuff TEXT,servicePrice TEXT,color TEXT,borderColor TEXT, empcode TEXT,otrr TEXT, recurringDay TEXT,repeatPattern TEXT,recurringNo TEXT,bCid TEXT,firstname TEXT,lastname TEXT,email TEXT,countrycode TEXT,mobile TEXT,staffnote TEXT,bookingType TEXT)");
  }

  Future<int> saveBooking(Booking booking) async {
    var dbClient = await db;
    int result = await dbClient.insert(bookingsTable, booking.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

  Future<int> saveBookings(List<Booking> bookings) async {
    var dbClient = await db;
    int result;
    for(Booking booking in bookings) {
      result = await dbClient.insert(bookingsTable, booking.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    }
    return result;
  }

  Future<List<Booking>> getBookings(String storeId) async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Bookings WHERE storeid= ${storeId}');
    List<Booking> bookingsList = new List();
    for (int i = 0; i < list.length; i++) {
      var eachBooking = new Booking(
        id: list[i]["id"],
        resourceId: list[i]["resourceId"],
        title: list[i]["title"],
        start: DateTime.parse(list[i]["start"]),
        end: DateTime.parse(list[i]["end"]),
        storeid: list[i]["storeid"],
        servicecode: list[i]["servicecode"],
        serviceName: list[i]["serviceName"],
        serviceDefdur: list[i]["serviceDefdur"],
        servicePrebuff: list[i]["servicePrebuff"],
        servicePostbuff: list[i]["servicePostbuff"],
        servicePrice: list[i]["servicePrice"],
        color: list[i]["color"],
        borderColor: list[i]["borderColor"],
        empcode: list[i]["empcode"],
        otrr: list[i]["otrr"],
        recurringDay: list[i]["recurringDay"],
        repeatPattern: list[i]["repeatPattern"],
        recurringNo: list[i]["recurringNo"],
        bCid: list[i]["bCid"],
        firstname: list[i]["firstname"],
        lastname: list[i]["lastname"],
        email: list[i]["email"],
        countrycode: list[i]["countrycode"],
        mobile: list[i]["mobile"],
        staffnote: list[i]["staffnote"],
        bookingType: list[i]["bookingType"],
      );
      bookingsList.add(eachBooking);
    }
//    print("DB data.... " + bookingsList.toString());
    return bookingsList;
  }

  Future<List<Booking>> getBookingsByDate(String storeId,String date) async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Bookings WHERE storeid= $storeId AND start like "$date%"');
    List<Booking> bookingsList = new List();
    for (int i = 0; i < list.length; i++) {
      var eachBooking = new Booking(
        id: list[i]["id"],
        resourceId: list[i]["resourceId"],
        title: list[i]["title"],
        start: DateTime.parse(list[i]["start"]),
        end: DateTime.parse(list[i]["end"]),
        storeid: list[i]["storeid"],
        servicecode: list[i]["servicecode"],
        serviceName: list[i]["serviceName"],
        serviceDefdur: list[i]["serviceDefdur"],
        servicePrebuff: list[i]["servicePrebuff"],
        servicePostbuff: list[i]["servicePostbuff"],
        servicePrice: list[i]["servicePrice"],
        color: list[i]["color"],
        borderColor: list[i]["borderColor"],
        empcode: list[i]["empcode"],
        otrr: list[i]["otrr"],
        recurringDay: list[i]["recurringDay"],
        repeatPattern: list[i]["repeatPattern"],
        recurringNo: list[i]["recurringNo"],
        bCid: list[i]["bCid"],
        firstname: list[i]["firstname"],
        lastname: list[i]["lastname"],
        email: list[i]["email"],
        countrycode: list[i]["countrycode"],
        mobile: list[i]["mobile"],
        staffnote: list[i]["staffnote"],
        bookingType: list[i]["bookingType"],
      );
      bookingsList.add(eachBooking);
    }
    print("DB data.... " + bookingsList.toString());
    return bookingsList;
  }

  void clearBookings() async{
    print('bookings delete DB called!!!!!!!!!!!!!');
    _bookings.close();

    await deleteDatabase(await getDatabasesPath());

  }
}
