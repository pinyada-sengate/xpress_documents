class CustomerCase {
  final String customerId;
  final String caseType;
  final String caseStatus;
  final DateTime startDate;
  final int price;
  final int paid;
//  final String paidDate;

  CustomerCase({
    required this.customerId,
    required this.caseType,
    required this.caseStatus,
    required this.startDate,
    this.price = 0,
    this.paid = 0,
    //required this.paidDate,
  });

  factory CustomerCase.fromJson(Map<String, dynamic> json) {
    return CustomerCase(
      customerId: json['customerId'] as String,
      caseType: json['caseType'] as String,
      caseStatus: json['caseStatus'] as String,
      startDate: json['startDate'] as DateTime,
      price: json['price'] as int,
      paid: json['paid'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customerId'] = customerId;
    data['caseType'] = caseType;
    data['caseStatus'] = caseStatus;
    data['startDate'] = startDate;
    data['price'] = price;
    data['paid'] = paid;
    return data;
  }
}
