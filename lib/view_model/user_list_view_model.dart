import 'package:flutter/cupertino.dart';

import '../model/user.dart';
import '../service/user_service.dart';

class UserListViewModel extends ChangeNotifier {

  UserService userService;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  UserListViewModel(this.userService);

  List<User> userList = [];

  setUserList(List<User> userlist) {
    this.userList = userlist;
    notifyListeners();
  }

  Future getUserList() {
    _isLoading = true;
    return userService.fetchUser().then((value) {
      _isLoading = false;
      setUserList(value);
    }).onError((error, stackTrace) {
      _isLoading = true;
      print('Error while fetching user data: ${error.toString()}');
    });
  }
}