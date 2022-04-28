class CustomerCase {
  late String? id;
  final String customerId;
  final String caseType;
  final String alienNumber;
  final String caseStatus;
  final DateTime startDate;
  final int price;
  final int paid;
  final int lastPayment;
  final DateTime lastPaymentDate;

  CustomerCase({
    this.id,
    required this.customerId,
    required this.caseType,
    required this.alienNumber,
    required this.caseStatus,
    required this.startDate,
    this.price = 0,
    this.paid = 0,
    this.lastPayment = 0,
    required this.lastPaymentDate,
  });

  factory CustomerCase.fromJson(Map<String, dynamic> json) {
    return CustomerCase(
      customerId: json['customerId'] as String,
      caseType: json['caseType'] as String,
      alienNumber: json['alienNumber'] as String,
      caseStatus: json['caseStatus'] as String,
      startDate: json['startDate'].toDate() as DateTime,
      price: json['price'] as int,
      paid: json['paid'] as int,
      lastPayment: json['lastPayment'] as int,
      lastPaymentDate: json['lastPaymentDate'].toDate() as DateTime,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customerId'] = customerId;
    data['caseType'] = caseType;
    data['alienNumber'] = alienNumber;
    data['caseStatus'] = caseStatus;
    data['startDate'] = startDate;
    data['price'] = price;
    data['paid'] = paid;
    data['lastPayment'] = lastPayment;
    data['lastPaymentDate'] = lastPaymentDate;
    return data;
  }
}
