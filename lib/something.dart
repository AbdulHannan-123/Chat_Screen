// import 'package:api_calling_reverpod/models/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailPage extends StatelessWidget {
  // const DetailPage({Key? key,required this.user}) : super(key: key);

  // final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('DETAILS'),
      ),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage:NetworkImage(''),
            ),
            // Text(user.firstname),
            // Text(user.email),
            // Text(user.id.toString())
          ],
        ),
      ),
    );
  }
}