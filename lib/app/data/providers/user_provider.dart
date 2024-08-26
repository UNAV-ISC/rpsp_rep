import 'package:get/get.dart';
import 'package:rpsp_main/app/data/models/user.dart';

class UserProvider extends GetxService {
  User user = User(
    name: 'Alex',
    lastName: 'Fernandez',
    email: 'alex@gmail.com',
    birthDate: '02 de Febrero 1993',
    country: 'Cuba',
    county: 'Santiago',
    language: 'Español',
    sex: 'Masculino',
    darkMode: false,
    level: 3,
  );
}
