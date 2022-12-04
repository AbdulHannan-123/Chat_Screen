import 'package:chat_screen_for/group_chat/create_group/create_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddMembersInGroup extends StatelessWidget {
  const AddMembersInGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Members"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {},
                    leading: Icon(Icons.account_circle),
                    title: Text("User 2"),
                    trailing: Icon(Icons.close),
                  );
                },
              ),
            ),
            SizedBox(
              height: size.height / 20,
            ),
            Container(
              height: size.height / 14,
              width: size.width,
              alignment: Alignment.center,
              child: Container(
                height: size.height / 14,
                width: size.width / 1.2,
                child: TextField(
                  // controller: _search,
                  decoration: InputDecoration(
                    hintText: "Search",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height / 50,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Search"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.forward),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => CreateGroup(),
          ),
        ),
      ),
    );
  }
}
