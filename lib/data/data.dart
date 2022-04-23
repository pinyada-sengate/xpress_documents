// User
import '../models/customer.dart';
import '../models/user.dart';
import '../models/customer_case.dart';

final currentUser = User(
  name: 'Jenny Dorado',
  customers: [
    Customer(
      id: '1',
      name: 'Cristian Mitchel',
      surname: 'Briceno Rojas',
      imageUrl: 'assets/images/cristian_rojas.png',
      phoneNumber: '5555456868',
      email: 'cristian@gmail.com',
      address: '7434 ella ln',
      city: 'Orlando',
      state: 'Florida',
      zipCode: '34768',
      price: 1000,
      paid: 1000,
//      caseType: '',
//      caseStatus: '',
//      startDate: 'Nov 04, 2021',
//      paidDate: 'Nov 30, 2021',
    ),
    Customer(
      id: '2',
      name: 'Pinyada',
      surname: 'Sengate',
      imageUrl: 'assets/images/pinyada_sengate.jpg',
      phoneNumber: '0874969749',
      email: 'pinyada@gmail.com',
      address: '704/30',
      city: 'Mueang',
      state: 'Samut Prakan',
      zipCode: '10270',
      price: 1000,
      paid: 300,
//      caseType: '',
//      caseStatus: '',
//      startDate: 'Nov 04, 2021',
//      paidDate: 'Nov 30, 2021',
    ),
  ],
  customerCases: [
    CustomerCase(
      customerId: '1',
      caseType: 'Permanent Residence',
      alienNumber: '1111111',
      caseStatus: 'New',
      startDate: DateTime.now(),
      price: 1000,
      paid: 1000,
    ),
    CustomerCase(
      customerId: '2',
      caseType: 'Permanent Residence',
      alienNumber: '2222222',
      caseStatus: 'New',
      startDate: DateTime.now(),
      price: 1000,
      paid: 300,
    ),
  ],
);
