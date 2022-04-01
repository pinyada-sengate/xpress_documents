// User
import '../models/customer.dart';
import '../models/user.dart';

final currentUser = User(
  name: 'Jenny Dorado',
  customers: [
    Customer(
      name: 'Cristian Mitchel',
      surname: 'Briceno Rojas',
      imageUrl: 'assets/images/cristian_rojas.png',
      price: 1000,
      paid: 1000,
    ),
    Customer(
      name: 'Pinyada',
      surname: 'Sengate',
      imageUrl: 'assets/images/pinyada_sengate.jpg',
      price: 1000,
      paid: 300,
    ),
  ],
);