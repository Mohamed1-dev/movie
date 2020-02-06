import 'package:shared_preferences/shared_preferences.dart';

import '../Models/user.dart';

class Movies{

  
    Future<User> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    User user = new User();
    user.name = prefs.get('user_name');
    user.image = prefs.get('user_image');

    return user;
  }
}