import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:updated_list_provider/service/user_service.dart';
import 'package:updated_list_provider/ui/user_list_screen.dart';
import 'package:updated_list_provider/view_model/user_list_view_model.dart';
import 'package:updated_list_provider/view_model/user_view_model.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => Dio(
            BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/')
        )),
        ProxyProvider<Dio, UserService>(
          update: (context,dio,userService) => UserService(dio),
        ),
        ChangeNotifierProvider(
            create: (context) => UserListViewModel(
                Provider.of<UserService>(context,listen: false))),
        ChangeNotifierProvider(
            create: (context) => UserViewModel(
                Provider.of<UserService>(context, listen: false)))
      ],

      child: MaterialApp(
        title: "User List",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.teal),

        home: const UserListScreen(),

      ),
    );

  }

}
