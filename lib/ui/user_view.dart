import 'package:flutter/material.dart';


import '../model/user.dart';
import '../view_model/user_view_model.dart';

class UserView extends StatefulWidget {
  final User user;

  const UserView({Key? key, required this.user}): super(key: key);

  @override
  State<UserView> createState() => _UserViewState(user);

}

class _UserViewState extends State<UserView> {
  late UserViewModel _userViewModel;
  late User user;

  _UserViewState(this.user);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: null,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(user.title,style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
