import 'package:flutter/cupertino.dart';


import '../model/user.dart';
import '../service/user_service.dart';

class UserViewModel extends ChangeNotifier {
  late User user;
  bool _isLoading = false;
  UserService userService;



  UserViewModel(this.userService);

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  setUser(User user) {
    this.user = user;
    notifyListeners();
  }

  Future getUserDetails(int id) {
    _isLoading = true;
    return userService.fetchUserDetails(id).then((value) {
      _isLoading = false;
      setUser(value);
    }).onError((error, stackTrace) {
      _isLoading = true;
      print("Error while fetching the post detail: ${error.toString()}");
    });
  }
}
