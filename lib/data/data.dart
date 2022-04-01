// User
import '../models/customer.dart';
import '../models/user.dart';

final currentUser = User(
  name: 'Jenny Dorado',
  customers: [
    Customer(
      id: '1',
      name: 'Cristian Mitchel',
      surname: 'Briceno Rojas',
      imageUrl: 'assets/images/cristian_rojas.png',
      phoneNumber: '',
      email: '',
      address: '',
      city: '',
      state: '',
      zipcode: 34768,
      price: 1000,
      paid: 1000,
      caseType: '',
      caseStatus: '',
      startDate: 'Nov 04, 2021',
      paidDate: 'Nov 30, 2021',
    ),
    Customer(
      id: '2',
      name: 'Pinyada',
      surname: 'Sengate',
      imageUrl: 'assets/images/pinyada_sengate.jpg',
      phoneNumber: '',
      email: '',
      address: '',
      city: '',
      state: '',
      zipcode: 34768,
      price: 1000,
      paid: 300,
      caseType: '',
      caseStatus: '',
      startDate: 'Nov 04, 2021',
      paidDate: 'Nov 30, 2021',
    ),
  ],
);