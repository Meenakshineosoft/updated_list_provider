import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:updated_list_provider/ui/user_list_item_view.dart';

import '../view_model/user_list_view_model.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {

  @override
  void initState() {
    UserListViewModel userListViewModel =
    Provider.of<UserListViewModel>(context, listen: false);
    userListViewModel.getUserList();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    UserListViewModel user;
    return Scaffold(
      appBar: AppBar(
          title: const Text("User List")
      ),
      body: ChangeNotifierProvider.value(
        value: Provider.of<UserListViewModel>(context, listen: false),
        child: Consumer<UserListViewModel>(
          builder: (context, userListViewModel, child) {
            return userListViewModel.isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                itemCount: userListViewModel.userList.length,
                itemBuilder: (BuildContext context, int index) {
                  //  return UserView(user: userListViewModel.userList[index]);
                  return UserListItemView(
                      user: userListViewModel.userList[index]);

                });
          },
        ),
      ),


    );
  }


}
