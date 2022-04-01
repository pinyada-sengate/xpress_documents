class Customer {
  final String id;
  final String name;
  final String surname;
  final String imageUrl;
  final String phoneNumber;
  final String email;
  final String address;
  final String city;
  final String state;
  final int zipcode;

  //case info
  final String caseType;
  final String caseStatus;
  final String startDate;
  final int price;
  final int paid;
  final String paidDate;

  Customer({
    required this.id,
    required this.name,
    required this.surname,
    required this.imageUrl,
    required this.phoneNumber,
    required this.email,
    required this.address,
    required this.city,
    required this.state,
    required this.zipcode,

    //case info
    required this.caseType,
    required this.caseStatus,
    required this.startDate,
    required this.price,
    required this.paid,
    required this.paidDate,
  });
}