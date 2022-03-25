import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../view_model/user_view_model.dart';

class DetailScreen extends StatefulWidget {
  final int id;

  const DetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    UserViewModel userViewModel =
    Provider.of<UserViewModel>(context, listen: false);
    userViewModel.getUserDetails(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Detail"),
      ),
      body: ChangeNotifierProvider.value(
        value: Provider.of<UserViewModel>(context, listen: false),
        child: Consumer<UserViewModel>(
          builder: (context, userViewModel, child) {
            return userViewModel.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichTextView(
                      tag: "UserId: ",
                      value: userViewModel.user.userId.toString()),
                  const SizedBox(height: 10),
                  RichTextView(
                      tag: "Id: ",
                      value: userViewModel.user.id.toString()),
                  const SizedBox(height: 10),
                  RichTextView(
                      tag: "Title: ",
                      value: userViewModel.user.title),
                  const SizedBox(height: 10),
                  RichTextView(
                      tag: "Body: ", value: userViewModel.user.body)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class RichTextView extends StatelessWidget {
  final String tag;
  final String value;

  const RichTextView({Key? key, required this.tag, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
            children: <TextSpan>[
              TextSpan(
                  text: tag,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: value)
            ]));
  }
}