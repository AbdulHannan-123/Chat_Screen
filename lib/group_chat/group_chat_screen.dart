import 'package:chat_screen_for/group_chat/create_group/add_members.dart';
import 'package:chat_screen_for/group_chat/groups_chatroom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class GroupChatHomeScreen extends StatefulWidget {
  const GroupChatHomeScreen({Key? key}) : super(key: key);

  @override
  State<GroupChatHomeScreen> createState() => _GroupChatHomeScreenState();
}

class _GroupChatHomeScreenState extends State<GroupChatHomeScreen> {
  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Groups"),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => GroupChatRoom(),));
            },
            leading: Icon(Icons.group),
            title: Text('Group $index'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.create),
        onPressed: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (_) =>AddMembersInGroup() ,)),
        tooltip: "Create Group",
      ),
    );
  }
}
