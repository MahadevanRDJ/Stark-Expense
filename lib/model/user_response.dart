class Address {
  String? address;
  String? city;
  Coordinates? coordinates;
  String? postalCode;
  String? state;

  Address(
      {this.address, this.city, this.coordinates, this.postalCode, this.state});

  Address.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    city = json['city'];
    coordinates = json['coordinates'] != null
        ? Coordinates?.fromJson(json['coordinates'])
        : null;
    postalCode = json['postalCode'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['city'] = city;
    data['coordinates'] = coordinates!.toJson();
    data['postalCode'] = postalCode;
    data['state'] = state;
    return data;
  }
}

class Bank {
  String? cardExpire;
  String? cardNumber;
  String? cardType;
  String? currency;
  String? iban;

  Bank(
      {this.cardExpire,
      this.cardNumber,
      this.cardType,
      this.currency,
      this.iban});

  Bank.fromJson(Map<String, dynamic> json) {
    cardExpire = json['cardExpire'];
    cardNumber = json['cardNumber'];
    cardType = json['cardType'];
    currency = json['currency'];
    iban = json['iban'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cardExpire'] = cardExpire;
    data['cardNumber'] = cardNumber;
    data['cardType'] = cardType;
    data['currency'] = currency;
    data['iban'] = iban;
    return data;
  }
}

class Company {
  Address? address;
  String? department;
  String? name;
  String? title;

  Company({this.address, this.department, this.name, this.title});

  Company.fromJson(Map<String, dynamic> json) {
    address =
        json['address'] != null ? Address?.fromJson(json['address']) : null;
    department = json['department'];
    name = json['name'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address!.toJson();
    data['department'] = department;
    data['name'] = name;
    data['title'] = title;
    return data;
  }
}

class Coordinates {
  double? lat;
  double? lng;

  Coordinates({this.lat, this.lng});

  Coordinates.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}

class Crypto {
  String? coin;
  String? wallet;
  String? network;

  Crypto({this.coin, this.wallet, this.network});

  Crypto.fromJson(Map<String, dynamic> json) {
    coin = json['coin'];
    wallet = json['wallet'];
    network = json['network'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coin'] = coin;
    data['wallet'] = wallet;
    data['network'] = network;
    return data;
  }
}

class Hair {
  String? color;
  String? type;

  Hair({this.color, this.type});

  Hair.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['color'] = color;
    data['type'] = type;
    return data;
  }
}

class People {
  List<User?>? users;
  int? total;
  int? skip;
  int? limit;

  People({this.users, this.total, this.skip, this.limit});

  People.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = <User>[];
      json['users'].forEach((v) {
        users!.add(User.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (users != null) {
      data['users'] = users!.map((v) => v?.toJson()).toList();
    } else {
      data['users'] = null;
    }
    data['total'] = total;
    data['skip'] = skip;
    data['limit'] = limit;
    return data;
  }

  @override
  String toString() {
    return 'People{users: $users, total: $total, skip: $skip, limit: $limit}';
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? maidenName;
  int? age;
  String? gender;
  String? email;
  String? phone;
  String? username;
  String? password;
  String? birthDate;
  String? image;
  String? bloodGroup;
  int? height;
  double? weight;
  String? eyeColor;
  Hair? hair;
  String? domain;
  String? ip;
  Address? address;
  String? macAddress;
  String? university;
  Bank? bank;
  Company? company;
  String? ein;
  String? ssn;
  String? userAgent;
  Crypto? crypto;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.maidenName,
      this.age,
      this.gender,
      this.email,
      this.phone,
      this.username,
      this.password,
      this.birthDate,
      this.image,
      this.bloodGroup,
      this.height,
      this.weight,
      this.eyeColor,
      this.hair,
      this.domain,
      this.ip,
      this.address,
      this.macAddress,
      this.university,
      this.bank,
      this.company,
      this.ein,
      this.ssn,
      this.userAgent,
      this.crypto});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    maidenName = json['maidenName'];
    age = json['age'];
    gender = json['gender'];
    email = json['email'];
    phone = json['phone'];
    username = json['username'];
    password = json['password'];
    birthDate = json['birthDate'];
    image = json['image'];
    bloodGroup = json['bloodGroup'];
    height = json['height'];
    weight = (json['weight']).ceilToDouble();
    eyeColor = json['eyeColor'];
    hair = json['hair'] != null ? Hair?.fromJson(json['hair']) : null;
    domain = json['domain'];
    ip = json['ip'];
    address =
        json['address'] != null ? Address?.fromJson(json['address']) : null;
    macAddress = json['macAddress'];
    university = json['university'];
    bank = json['bank'] != null ? Bank?.fromJson(json['bank']) : null;
    company =
        json['company'] != null ? Company?.fromJson(json['company']) : null;
    ein = json['ein'];
    ssn = json['ssn'];
    userAgent = json['userAgent'];
    crypto = json['crypto'] != null ? Crypto?.fromJson(json['crypto']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['maidenName'] = maidenName;
    data['age'] = age;
    data['gender'] = gender;
    data['email'] = email;
    data['phone'] = phone;
    data['username'] = username;
    data['password'] = password;
    data['birthDate'] = birthDate;
    data['image'] = image;
    data['bloodGroup'] = bloodGroup;
    data['height'] = height;
    data['weight'] = weight;
    data['eyeColor'] = eyeColor;
    data['hair'] = hair!.toJson();
    data['domain'] = domain;
    data['ip'] = ip;
    data['address'] = address!.toJson();
    data['macAddress'] = macAddress;
    data['university'] = university;
    data['bank'] = bank!.toJson();
    data['company'] = company!.toJson();
    data['ein'] = ein;
    data['ssn'] = ssn;
    data['userAgent'] = userAgent;
    data['crypto'] = crypto!.toJson();
    return data;
  }

  @override
  String toString() {
    return 'User{id: $id, firstName: $firstName, lastName: $lastName, maidenName: $maidenName, age: $age, gender: $gender, email: $email, phone: $phone, username: $username, password: $password, birthDate: $birthDate, image: $image, bloodGroup: $bloodGroup, height: $height, weight: $weight, eyeColor: $eyeColor, hair: $hair, domain: $domain, ip: $ip, address: $address, macAddress: $macAddress, university: $university, bank: $bank, company: $company, ein: $ein, ssn: $ssn, userAgent: $userAgent, crypto: $crypto}';
  }
}

class Details {
  Map<String, dynamic>? _details;

  Details(this._details);

  Map<String, dynamic> get details => _details!;

  set details(Map<String, dynamic> value) {
    _details = value;
  }

  Details.fromJson(Map<String, dynamic> json) {
    details = json['details'];
  }

  @override
  String toString() {
    return 'Details{details: $_details}';
  }
}

class Detail {
  String? _label;
  String? _value;

  Detail(this._label, this._value);

  String get value => _value!;

  set value(String value) {
    _value = value;
  }

  String get label => _label!;

  set label(String value) {
    _label = value;
  }

  Detail.fromJson(Map<String, dynamic> json) {
    _label = json["label"];
    _value = json["value"];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["label"] = _label;
    map["value"] = _value;
    return map;
  }

  @override
  String toString() {
    return 'Detail{_label: $_label, _value: $_value}';
  }
}
