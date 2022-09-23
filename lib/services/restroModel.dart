import 'dart:convert';

class Task {
  Task({
    required this.data,
    required this.status,
    required this.message,
    required this.statusCode,
  });

  Data data;
  String status;
  String message;
  int statusCode;

  // factory Task.fromJson(String str) => Task.fromJson(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        data: Data.fromJson(json["data"]),
        status: json["status"],
        message: json["message"],
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toMap() => {
        "data": data.toMap(),
        "status": status,
        "message": message,
        "statusCode": statusCode,
      };
}

class Data {
  Data({
    required this.data,
    required this.totalItems,
    required this.pageNo,
    required this.size,
    required this.sortBy,
    required this.direction,
  });

  List<Datum> data;
  int totalItems;
  int pageNo;
  int size;
  String sortBy;
  String direction;

  // factory Data.fromJson(String str) => Data.fromJson(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        totalItems: json["totalItems"],
        pageNo: json["pageNo"],
        size: json["size"],
        sortBy: json["sortBy"],
        direction: json["direction"],
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "totalItems": totalItems,
        "pageNo": pageNo,
        "size": size,
        "sortBy": sortBy,
        "direction": direction,
      };
}

class Datum {
  Datum({
    required this.location,
    required this.claimCode,
    required this.state,
    required this.createdby,
    required this.imageUrl,
    required this.allowDelivery,
    required this.shortMessage,
    required this.ownerMobile,
    required this.id,
    required this.address,
    required this.rating,
    required this.createdate,
    required this.description,
    required this.avgTime,
    required this.restaurantName,
    required this.lastupdate,
    required this.type,
    required this.allowTakeaway,
    required this.whatsappNumber,
    required this.isLive,
    required this.pics,
    required this.restaurantId,
    required this.isOnline,
    required this.neighbourhood,
    required this.updatedby,
    required this.pincode,
    required this.allowReservations,
    required this.city,
    required this.claimedEmails,
    required this.gstPercent,
    required this.ownerEmail,
    required this.owner,
    required this.serviceChargePercent,
    required this.geohash,
    required this.claimed,
    required this.online,
    required this.isOpen,
  });

  Location location;
  String claimCode;
  String state;
  String createdby;
  String imageUrl;
  bool allowDelivery;
  String shortMessage;
  String ownerMobile;
  String id;
  String address;
  double rating;
  Date? createdate;
  String description;
  dynamic avgTime;
  String restaurantName;
  Date lastupdate;
  List<String>? type;
  bool allowTakeaway;
  dynamic whatsappNumber;
  bool isLive;
  List<String> pics;
  String restaurantId;
  bool isOnline;
  String neighbourhood;
  String updatedby;
  dynamic pincode;
  bool allowReservations;
  String city;
  List<ClaimedEmail>? claimedEmails;
  double gstPercent;
  String ownerEmail;
  String owner;
  int serviceChargePercent;
  String geohash;
  bool claimed;
  bool online;
  bool isOpen;

  // factory Datum.fromJson(String str) => Datum.fromJson(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        location: Location.fromJson(json["location"]),
        claimCode: json["Claim Code"],
        state: json["state"] == null ? null : json["state"],
        createdby: json["createdby"] == null ? null : json["createdby"],
        imageUrl: json["imageUrl"],
        allowDelivery: json["allowDelivery"],
        shortMessage:
            json["shortMessage"] == null ? null : json["shortMessage"],
        ownerMobile: json["ownerMobile"],
        id: json["id"],
        address: json["address"],
        rating: json["rating"].toDouble(),
        createdate: json["createdate"] == null
            ? null
            : Date.fromJson(json["createdate"]),
        description: json["description"],
        avgTime: json["avgTime"],
        restaurantName: json["restaurantName"],
        lastupdate: Date.fromJson(json["lastupdate"]),
        type: json["type"] == null
            ? null
            : List<String>.from(json["type"].map((x) => x)),
        allowTakeaway: json["allowTakeaway"],
        whatsappNumber: json["whatsappNumber"],
        isLive: json["isLive"],
        pics: List<String>.from(json["pics"].map((x) => x)),
        restaurantId:
            json["restaurantId"] == null ? null : json["restaurantId"],
        isOnline: json["isOnline"],
        neighbourhood:
            json["neighbourhood"] == null ? null : json["neighbourhood"],
        updatedby: json["updatedby"],
        pincode: json["pincode"],
        allowReservations: json["allowReservations"],
        city: json["city"],
        claimedEmails: json["claimedEmails"] == null
            ? null
            : List<ClaimedEmail>.from(
                json["claimedEmails"].map((x) => ClaimedEmail.fromJson(x))),
        gstPercent:
            json["gstPercent"] == null ? null : json["gstPercent"].toDouble(),
        ownerEmail: json["ownerEmail"] == null ? null : json["ownerEmail"],
        owner: json["owner"] == null ? null : json["owner"],
        serviceChargePercent: json["serviceChargePercent"] == null
            ? null
            : json["serviceChargePercent"],
        geohash: json["geohash"] == null ? null : json["geohash"],
        claimed: json["claimed"] == null ? null : json["claimed"],
        online: json["online"] == null ? null : json["online"],
        isOpen: json["isOpen"] == null ? null : json["isOpen"],
      );

  Map<String, dynamic> toMap() => {
        "location": location.toMap(),
        "Claim Code": claimCode,
        "state": state == null ? null : state,
        "createdby": createdby == null ? null : createdby,
        "imageUrl": imageUrl,
        "allowDelivery": allowDelivery,
        "shortMessage": shortMessage == null ? null : shortMessage,
        "ownerMobile": ownerMobile,
        "id": id,
        "address": address,
        "rating": rating,
        "createdate": createdate == null ? null : createdate?.toMap(),
        "description": description,
        "avgTime": avgTime,
        "restaurantName": restaurantName,
        "lastupdate": lastupdate.toMap(),
        "type": type == null ? null : List<dynamic>.from(type!.map((x) => x)),
        "allowTakeaway": allowTakeaway,
        "whatsappNumber": whatsappNumber,
        "isLive": isLive,
        "pics": List<dynamic>.from(pics.map((x) => x)),
        "restaurantId": restaurantId == null ? null : restaurantId,
        "isOnline": isOnline,
        "neighbourhood": neighbourhood == null ? null : neighbourhood,
        "updatedby": updatedby,
        "pincode": pincode,
        "allowReservations": allowReservations,
        "city": city,
        "claimedEmails": claimedEmails == null
            ? null
            : List<dynamic>.from(claimedEmails!.map((x) => x.toMap())),
        "gstPercent": gstPercent ?? null,
        "ownerEmail": ownerEmail ?? null,
        "owner": owner ?? null,
        "serviceChargePercent": serviceChargePercent ?? null,
        "geohash": geohash ?? null,
        "claimed": claimed == null ? null : claimed,
        "online": online == null ? null : online,
        "isOpen": isOpen == null ? null : isOpen,
      };
}

class ClaimedEmail {
  ClaimedEmail({
    required this.email,
    required this.uid,
  });

  String email;
  String uid;

  // factory ClaimedEmail.fromJson(String str) =>
  //     ClaimedEmail.fromJson(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ClaimedEmail.fromJson(Map<String, dynamic> json) => ClaimedEmail(
        email: json["email"],
        uid: json["uid"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "uid": uid,
      };
}

class Date {
  Date({
    required this.seconds,
    required this.nanoseconds,
  });

  int seconds;
  int nanoseconds;

  // factory Date.fromJson(String str) => Date.fromJson(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        seconds: json["_seconds"],
        nanoseconds: json["_nanoseconds"],
      );

  Map<String, dynamic> toMap() => {
        "_seconds": seconds,
        "_nanoseconds": nanoseconds,
      };
}

class Location {
  Location({
    required this.latitude,
    required this.longitude,
  });

  double latitude;
  double longitude;

  // factory Location.fromJson(String str) => Location.fromJson(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["_latitude"].toDouble(),
        longitude: json["_longitude"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "_latitude": latitude,
        "_longitude": longitude,
      };
}

class WhatsappNumberElement {
  WhatsappNumberElement({
    required this.number,
  });

  String number;

  // factory WhatsappNumberElement.fromJson(String str) =>
  //     WhatsappNumberElement.fromJson(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WhatsappNumberElement.fromJson(Map<String, dynamic> json) =>
      WhatsappNumberElement(
        number: json["number"],
      );

  Map<String, dynamic> toMap() => {
        "number": number,
      };
}
