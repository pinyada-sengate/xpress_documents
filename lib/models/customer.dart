class Customer {
  late String? id;
  final String name;
  final String surname;
  final String imageUrl;
  final String phoneNumber;
  final String email;
  final String address;
  final String city;
  final String state;
  final String zipCode;

  //case info
//  final String caseType;
//  final String caseStatus;
//  final String startDate;
  final int price;
  final int paid;
//  final String paidDate;

  Customer({
    this.id,
    required this.name,
    required this.surname,
    this.imageUrl = 'assets/images/profile_picture.png',
    required this.phoneNumber,
    required this.email,
    required this.address,
    required this.city,
    required this.state,
    required this.zipCode,

    //case info
//    required this.caseType,
//    required this.caseStatus,
//    required this.startDate,
    this.price = 0,
    this.paid = 0,
//    required this.paidDate,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      name: json['name'] as String,
      surname: json['surname'] as String,
      imageUrl: json['imageUrl'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String,
      address: json['address'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      zipCode: json['zipCode'] as String,
      price: json['price'] as int,
      paid: json['paid'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['surname'] = surname;
    data['imageUrl'] = imageUrl;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    data['address'] = address;
    data['city'] = city;
    data['state'] = state;
    data['zipCode'] = zipCode;

    data['price'] = price;
    data['paid'] = paid;
    return data;
  }
}
