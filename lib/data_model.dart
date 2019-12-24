// To parse this JSON data, do
//
//     final booking = bookingFromJson(jsonString);

import 'dart:convert';

List<Booking> bookingFromJson(String str) => List<Booking>.from(json.decode(str).map((x) => Booking.fromJson(x)));

String bookingToJson(List<Booking> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Booking {
  String id;
  String resourceId;
  String title;
  DateTime start;
  DateTime end;
  String storeid;
  String servicecode;
  String serviceName;
  String serviceDefdur;
  String servicePrebuff;
  String servicePostbuff;
  String servicePrice;
  String color;
  String borderColor;
  String empcode;
  String otrr;
  String recurringDay;
  String repeatPattern;
  String recurringNo;
  String bCid;
  String firstname;
  String lastname;
  String email;
  String countrycode;
  String mobile;
  String staffnote;
  String bookingType;
  bool isSelected;

  Booking({
    this.id,
    this.resourceId,
    this.title,
    this.start,
    this.end,
    this.storeid,
    this.servicecode,
    this.serviceName,
    this.serviceDefdur,
    this.servicePrebuff,
    this.servicePostbuff,
    this.servicePrice,
    this.color,
    this.borderColor,
    this.empcode,
    this.otrr,
    this.recurringDay,
    this.repeatPattern,
    this.recurringNo,
    this.bCid,
    this.firstname,
    this.lastname,
    this.email,
    this.countrycode,
    this.mobile,
    this.staffnote,
    this.bookingType,
    this.isSelected,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    id: json["id"].toString(),
    resourceId: json["resourceId"].toString(),
    title: json["title"].toString(),
    start: DateTime.parse(json["start"]),
    end: DateTime.parse(json["end"]),
    storeid: json["storeid"].toString(),
    servicecode: json["servicecode"].toString(),
    serviceName: json["service_name"].toString(),
    serviceDefdur: json["service_defdur"].toString(),
    servicePrebuff: json["service_prebuff"].toString(),
    servicePostbuff: json["service_postbuff"].toString(),
    servicePrice: json["service_price"].toString(),
    color: json["color"].toString(),
    borderColor: json["borderColor"].toString(),
    empcode: json["empcode"].toString(),
    otrr: json["otrr"].toString(),
    recurringDay: json["recurring_day"].toString(),
    repeatPattern: json["repeat_pattern"].toString(),
    recurringNo: json["recurring_no"].toString(),
    bCid: json["b_cid"].toString(),
    firstname: json["firstname"].toString(),
    lastname: json["lastname"].toString(),
    email: json["email"].toString(),
    countrycode: json["countrycode"].toString(),
    mobile: json["mobile"].toString(),
    staffnote: json["staffnote"].toString(),
    bookingType: json["booking_type"].toString(),
    isSelected: false,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "resourceId": resourceId,
    "title": title,
    "start": start.toIso8601String(),
    "end": end.toIso8601String(),
    "storeid": storeid,
    "servicecode": servicecode,
    "service_name": serviceName,
    "service_defdur": serviceDefdur,
    "service_prebuff": servicePrebuff,
    "service_postbuff": servicePostbuff,
    "service_price": servicePrice,
    "color": color,
    "borderColor": borderColor,
    "empcode": empcode,
    "otrr": otrr,
    "recurring_day": recurringDay,
    "repeat_pattern": repeatPattern,
    "recurring_no": recurringNo,
    "b_cid": bCid,
    "firstname": firstname,
    "lastname": lastname,
    "email": email,
    "countrycode": countrycode,
    "mobile": mobile,
    "staffnote": staffnote,
    "booking_type": bookingType,
    "isSelected": false,
  };

  @override
  String toString() {
    return 'Booking{'
        'id: $id,'
        'resourceId: $resourceId,'
        'title: $title,'
        'start: $start,'
        'end: $end,'
        'storeid: $storeid,'
        'servicecode: $servicecode,'
        'service_name: $serviceName,'
        'service_defdur: $serviceDefdur,'
        'service_prebuff: $servicePrebuff,'
        'service_postbuff: $servicePostbuff,'
        'service_price: $servicePrice,'
        'color: $color,'
        'borderColor: $borderColor,'
        'empcode: $empcode,'
        'otrr: $otrr,'
        'recurring_day: $recurringDay,'
        'repeat_pattern: $repeatPattern,'
        'recurring_no: $recurringNo,'
        'b_cid: $bCid,'
        'firstname: $firstname,'
        'lastname: $lastname,'
        'email: $email,'
        'countrycode: $countrycode,'
        'mobile: $mobile,'
        'staffnote: $staffnote,'
        'booking_type: $bookingType,'
        'isSelected: false}';
  }

  Booking.map(dynamic json) {
    this.id = json["id"];
    this.resourceId = json["resourceId"];
    this.title = json["title"];
    this.start = DateTime.parse(json["start"]);
    this.end = DateTime.parse(json["end"]);
    this.storeid = json["storeid"];
    this.servicecode = json["servicecode"];
    this.serviceName = json["service_name"];
    this.serviceDefdur = json["service_defdur"];
    this.servicePrebuff = json["service_prebuff"];
    this.servicePostbuff = json["service_postbuff"];
    this.servicePrice = json["service_price"];
    this.color = json["color"];
    this.borderColor = json["borderColor"];
    this.empcode = json["empcode"];
    this.otrr = json["otrr"];
    this.recurringDay = json["recurring_day"];
    this.repeatPattern = json["repeat_pattern"];
    this.recurringNo = json["recurring_no"];
    this.bCid = json["b_cid"];
    this.firstname = json["firstname"];
    this.lastname = json["lastname"];
    this.email = json["email"];
    this.countrycode = json["countrycode"];
    this.mobile = json["mobile"];
    this.staffnote = json["staffnote"];
    this.bookingType = json["booking_type"];
    this.isSelected = false;
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id ?? "";
    map["resourceId"] = resourceId ?? "";
    map["title"] = title ?? "";
    map["start"] = start.toString() ?? "";
    map["end"] = end.toString() ?? "";
    map["storeid"] = storeid ?? "";
    map["servicecode"] = servicecode ?? "";
    map["serviceName"]= serviceName ?? "";
    map["serviceDefdur"]= serviceDefdur ?? "";
    map["servicePrebuff"]= servicePrebuff ?? "";
    map["servicePostbuff"]= servicePostbuff ?? "";
    map["servicePrice"]= servicePrice ?? "";
    map["color"]= color ?? "";
    map["borderColor"] = borderColor ?? "";
    map["empcode"] = empcode ?? "";
    map["otrr"] = otrr ?? "";
    map["recurringDay"] = recurringDay ?? "";
    map["repeatPattern"] = repeatPattern ?? "";
    map["recurringNo"] = recurringNo ?? "";
    map["bCid"] = bCid ?? "";
    map["firstname"] = firstname ?? "";
    map["lastname"] = lastname ?? "";
    map["email"] = email ?? "";
    map["countrycode"] = countrycode ?? "";
    map["mobile"] = mobile ?? "";
    map["staffnote"] = staffnote ?? "";
    map["bookingType"] = bookingType ?? "";
    map["isSelected"] = false ?? "";
    return map;
  }
}
