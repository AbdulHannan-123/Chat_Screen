import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class GroupInfo extends StatelessWidget {
  const GroupInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: BackButton(),
              ),
              Container(
                height: size.height / 8,
                width: size.width / 1.1,
                child: Row(
                  children: [
                    Container(
                      height: size.height / 11,
                      width: size.height / 11,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: Icon(
                        Icons.group,
                        color: Colors.white,
                        size: size.width / 14,
                      ),
                    ),
                    SizedBox(
                      width: size.width / 20,
                    ),
                    Expanded(
                      child: Container(
                        child: Text(
                          'Group Name',
                          style: TextStyle(
                              fontSize: size.width / 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height / 20,
              ),
              Container(
                width: size.width / 1.1,
                child: Text(
                  "60 Members",
                  style: TextStyle(
                    fontSize: size.width / 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: size.height / 20,
              ),
              //  this is for the Members Name
              Flexible(
                child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(Icons.account_circle),
                      title: Text(
                        'User1',
                        style: TextStyle(
                            fontSize: size.width / 22,
                            fontWeight: FontWeight.w500),
                      ),
                    );
                  },
                ),
              ),
              // SizedBox(
              //   height: size.height / 20,
              // ),
              ListTile(
                onTap: () {
                  
                },
                leading: Icon(Icons.logout),
                title: Text(
                  "Leave Group",
                  style: TextStyle(
                      fontSize: size.width / 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
