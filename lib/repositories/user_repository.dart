import 'package:tobetomobileapp/dummydata/user_data.dart';
import 'package:tobetomobileapp/models/user.dart';

class UserRepostory {
  //TODO: Eklenecek Login fonksiyonu.
  //! Geçici olarak bir veri eklendi.
  loginUser(String email, String password) {
    print(email);
    print(password);
    if (email == "1" && password == "2") {
      return UserData(id: "321312312", name: "Tuğçe", surname: "Kahya");
    } else if (email == "2" && password == "1") {
      return UserData(id: "3413215612", name: "Berke", surname: "Erçin");
    } else {
      return loginUserData;
    }
  }
  //TODO: Eklenecek Logout fonksiyonu.
}
