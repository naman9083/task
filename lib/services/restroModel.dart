class Task {
  Data? data;
  String? status;
  String? message;
  int? statusCode;

  Task({data, status, message, statusCode});

  Task.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    status = json['status'];
    message = json['message'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = status;
    data['message'] = message;
    data['statusCode'] = statusCode;
    return data;
  }
}

class Data {
  List<Data>? data;
  int? totalItems;
  int? pageNo;
  int? size;
  String? sortBy;
  String? direction;

  Data({data, totalItems, pageNo, size, sortBy, direction});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    totalItems = json['totalItems'];
    pageNo = json['pageNo'];
    size = json['size'];
    sortBy = json['sortBy'];
    direction = json['direction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data!.map((v) => v.toJson()).toList();
    data['totalItems'] = totalItems;
    data['pageNo'] = pageNo;
    data['size'] = size;
    data['sortBy'] = sortBy;
    data['direction'] = direction;
    return data;
  }
}

class Data2 {
  Location? location;
  String? claimCode;
  String? state;
  String? createdby;
  String? imageUrl;
  bool? allowDelivery;
  String? shortMessage;
  String? ownerMobile;
  String? id;
  String? address;
  double? rating;
  Createdate? createdate;
  String? description;
  String? avgTime;
  String? restaurantName;
  Createdate? lastupdate;
  List<String>? type;
  bool? allowTakeaway;
  String? whatsappNumber;
  bool? isLive;
  List<String>? pics;
  String? restaurantId;
  bool? isOnline;
  String? neighbourhood;
  String? updatedby;
  String? pincode;
  bool? allowReservations;
  String? city;
  List<ClaimedEmails>? claimedEmails;
  double? gstPercent;
  String? ownerEmail;
  String? owner;
  int? serviceChargePercent;
  String? geohash;
  bool? claimed;
  bool? online;
  bool? isOpen;

  Data2(
      {location,
      claimCode,
      state,
      createdby,
      imageUrl,
      allowDelivery,
      shortMessage,
      ownerMobile,
      id,
      address,
      rating,
      createdate,
      description,
      avgTime,
      restaurantName,
      lastupdate,
      type,
      allowTakeaway,
      whatsappNumber,
      isLive,
      pics,
      restaurantId,
      isOnline,
      neighbourhood,
      updatedby,
      pincode,
      allowReservations,
      city,
      claimedEmails,
      gstPercent,
      ownerEmail,
      owner,
      serviceChargePercent,
      geohash,
      claimed,
      online,
      isOpen});

  Data2.fromJson(Map<String, dynamic> json) {
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    claimCode = json['Claim Code'];
    state = json['state'];
    createdby = json['createdby'];
    imageUrl = json['imageUrl'];
    allowDelivery = json['allowDelivery'];
    shortMessage = json['shortMessage'];
    ownerMobile = json['ownerMobile'];
    id = json['id'];
    address = json['address'];
    rating = json['rating'];
    createdate = json['createdate'] != null
        ? Createdate.fromJson(json['createdate'])
        : null;
    description = json['description'];
    avgTime = json['avgTime'];
    restaurantName = json['restaurantName'];
    lastupdate = json['lastupdate'] != null
        ? Createdate.fromJson(json['lastupdate'])
        : null;
    type = json['type'].cast<String>();
    allowTakeaway = json['allowTakeaway'];
    whatsappNumber = json['whatsappNumber'];
    isLive = json['isLive'];
    pics = json['pics'].cast<String>();
    restaurantId = json['restaurantId'];
    isOnline = json['isOnline'];
    neighbourhood = json['neighbourhood'];
    updatedby = json['updatedby'];
    pincode = json['pincode'];
    allowReservations = json['allowReservations'];
    city = json['city'];
    if (json['claimedEmails'] != null) {
      claimedEmails = <ClaimedEmails>[];
      json['claimedEmails'].forEach((v) {
        claimedEmails!.add(ClaimedEmails.fromJson(v));
      });
    }
    gstPercent = json['gstPercent'];
    ownerEmail = json['ownerEmail'];
    owner = json['owner'];
    serviceChargePercent = json['serviceChargePercent'];
    geohash = json['geohash'];
    claimed = json['claimed'];
    online = json['online'];
    isOpen = json['isOpen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['Claim Code'] = claimCode;
    data['state'] = state;
    data['createdby'] = createdby;
    data['imageUrl'] = imageUrl;
    data['allowDelivery'] = allowDelivery;
    data['shortMessage'] = shortMessage;
    data['ownerMobile'] = ownerMobile;
    data['id'] = id;
    data['address'] = address;
    data['rating'] = rating;
    if (createdate != null) {
      data['createdate'] = createdate!.toJson();
    }
    data['description'] = description;
    data['avgTime'] = avgTime;
    data['restaurantName'] = restaurantName;
    if (lastupdate != null) {
      data['lastupdate'] = lastupdate!.toJson();
    }
    data['type'] = type;
    data['allowTakeaway'] = allowTakeaway;
    data['whatsappNumber'] = whatsappNumber;
    data['isLive'] = isLive;
    data['pics'] = pics;
    data['restaurantId'] = restaurantId;
    data['isOnline'] = isOnline;
    data['neighbourhood'] = neighbourhood;
    data['updatedby'] = updatedby;
    data['pincode'] = pincode;
    data['allowReservations'] = allowReservations;
    data['city'] = city;
    if (claimedEmails != null) {
      data['claimedEmails'] = claimedEmails!.map((v) => v.toJson()).toList();
    }
    data['gstPercent'] = gstPercent;
    data['ownerEmail'] = ownerEmail;
    data['owner'] = owner;
    data['serviceChargePercent'] = serviceChargePercent;
    data['geohash'] = geohash;
    data['claimed'] = claimed;
    data['online'] = online;
    data['isOpen'] = isOpen;
    return data;
  }
}

class Location {
  double? dLatitude;
  double? dLongitude;

  Location({dLatitude, dLongitude});

  Location.fromJson(Map<String, dynamic> json) {
    dLatitude = json['_latitude'];
    dLongitude = json['_longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_latitude'] = dLatitude;
    data['_longitude'] = dLongitude;
    return data;
  }
}

class Createdate {
  int? iSeconds;
  int? iNanoseconds;

  Createdate({iSeconds, iNanoseconds});

  Createdate.fromJson(Map<String, dynamic> json) {
    iSeconds = json['_seconds'];
    iNanoseconds = json['_nanoseconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_seconds'] = iSeconds;
    data['_nanoseconds'] = iNanoseconds;
    return data;
  }
}

class ClaimedEmails {
  String? email;
  String? uid;

  ClaimedEmails({email, uid});

  ClaimedEmails.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['uid'] = uid;
    return data;
  }
}
