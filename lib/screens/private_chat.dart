import 'package:fickle/api/firebase_api.dart';
import 'package:fickle/model/user.dart';
import 'package:fickle/widgets/chat_body_widget.dart';
import 'package:fickle/widgets/chat_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:fickle/widgets/loading.dart';

class ChatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.blue,
    body: SafeArea(
      child: StreamBuilder<List<ListOfUser>>(
        stream: FirebaseApi.getUsers(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Loading();
            default:
              if (snapshot.hasError) {
                print(snapshot.error);
                return buildText('Something Went Wrong Try later');
              } else {
                final users = snapshot.data;

                if (users.isEmpty) {
                  return buildText('No Users Found');
                } else
                  return Column(
                    children: [
                      ChatHeaderWidget(users: users),
                      ChatBodyWidget(users: users)
                    ],
                  );
              }
          }
        },
      ),
    ),
  );

  Widget buildText(String text) => Center(
    child: Text(
      text,
      style: TextStyle(fontSize: 24, color: Colors.white),
    ),
  );
}