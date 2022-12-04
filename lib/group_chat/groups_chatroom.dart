import 'package:chat_screen_for/group_chat/group_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class GroupChatRoom extends StatelessWidget {
  GroupChatRoom({Key? key}) : super(key: key);
  final TextEditingController _message = TextEditingController();
  String currentUserName = "User1";
  List<Map<String, dynamic>> dynamicChatList = [
    {
      "message": "User1 Created the group",
      "type": "notify",
    },
    {
      "message": "Hello this is user1",
      "send_by": "User1",
      "type": "text",
    },
    {
      "message": "Hello this is user 2",
      "send_by": "User4",
      "type": "text",
    },
    {
      "message": "Hello this is user 4",
      "send_by": "User6",
      "type": "text",
    },
    {
      "message": "Hello this is user 6",
      "send_by": "User8",
      "type": "text",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Group Name'),
        actions: [IconButton(onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => GroupInfo(),));
        }, icon: Icon(Icons.more_vert))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height / 1.27,
              width: size.width,
              child: ListView.builder(
                itemCount: dynamicChatList.length,
                itemBuilder: (context, index) {
                  return messageTile(size, dynamicChatList[index]);
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(34)),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _message,
                      decoration:
                          const InputDecoration(labelText: 'Send Message...'),
                      // onChanged: (value) {
                      //   setState(() {
                      //     _endmessage = value;
                      //   });
                      // },
                    ),
                  ),
                  IconButton(
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: () {},
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget messageTile(Size size, Map<String, dynamic> chatMap) {
    return Builder(
      builder: (_) {
        if (chatMap['type'] == 'text') {
          return Container(
            width: size.width,
            alignment: chatMap['send_by'] == currentUserName
                ? Alignment.centerRight
                : Alignment.centerLeft,
            padding: EdgeInsets.symmetric(
              horizontal: size.width / 100,
              vertical: size.height / 400,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
              margin: chatMap['send_by'] != currentUserName
                  ? const EdgeInsets.only(
                      right: 140, top: 3, bottom: 3, left: 10)
                  : const EdgeInsets.only(
                      left: 140, top: 3, bottom: 3, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.blue),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chatMap['send_by'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: size.height / 200,
                  ),
                  Text(
                    chatMap['message'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (chatMap['type'] == 'img') {
          return Container(
            width: size.width,
            alignment: chatMap['send_by'] == currentUserName
                ? Alignment.centerRight
                : Alignment.centerLeft,
            padding: EdgeInsets.symmetric(
              horizontal: size.width / 100,
              vertical: size.height / 400,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
              margin: chatMap['send_by'] != currentUserName
                  ? const EdgeInsets.only(
                      right: 140, top: 3, bottom: 3, left: 10)
                  : const EdgeInsets.only(
                      left: 140, top: 3, bottom: 3, right: 10),
              // decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(15), color: Colors.blue),
              height: size.height / 2,
              child: Image.network(chatMap['message']),
              //  Text(
              //   chatMap['message'],
              //   style: const TextStyle(
              //     color: Colors.white,
              //     fontSize: 16,
              //     fontWeight: FontWeight.w500,
              //   ),
              // ),
            ),
          );
        } else if (chatMap['type'] == 'notify') {
          return Container(
            color: Colors.red,
            width: size.width,
            alignment: Alignment.center,
            // padding: EdgeInsets.symmetric(
            //   horizontal: size.width / 100,
            //   vertical: size.height / 400,
            // ),
            child: Center(
              child: Container(
                // alignment:Alignment.center,

                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                // margin: chatMap['send_by'] != currentUserName
                //     ? const EdgeInsets.only(
                //         right: 140, top: 3, bottom: 3, left: 10)
                //     : const EdgeInsets.only(
                //         left: 140, top: 3, bottom: 3, right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black38),
                child: Text(
                  chatMap['message'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}