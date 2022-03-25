import 'package:flutter/material.dart';

import '../model/user.dart';
import 'detail_screen.dart';

class UserListItemView extends StatefulWidget {
  final User user;

  const UserListItemView({Key? key, required this.user}) : super(key: key);

  @override
  State<UserListItemView> createState() => _UserListItemViewState();
}

class _UserListItemViewState extends State<UserListItemView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(8),
      child: InkWell(
        focusColor: Colors.white38,
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(id: widget.user.id),
              ));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.user.id.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  )),
              Expanded(
                  flex: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.user.body.toString()),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}