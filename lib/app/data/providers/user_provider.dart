import 'package:get/get.dart';
import 'package:rpsp_main/app/data/models/user.dart';

class UserProvider extends GetxService {
  User user = User(
    name: 'Gamaliel',
    lastName: 'Hernandez',
    email: '+529531437195',
    birthDate: '30 Mayo',
    country: 'México',
    county: 'Sonora',
    language: 'Español',
    sex: 'Masculino',
    darkMode: false,
    level: 3,
  );
}
