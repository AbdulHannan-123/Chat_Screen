import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic>? userMap;
  bool isLoading = false;

  final TextEditingController _search = TextEditingController();

  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    setState(() {
      isLoading = true;
    });

    await _firestore
        .collection('users')
        .where('email', isEqualTo: _search.text)
        .get().then((value) {
          setState(() {
          userMap = value.docs[0].data();
          isLoading = false;
          });
          print(userMap);
        });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomeScreen"),
      ),
      body: isLoading
          ?const Center(child: CircularProgressIndicator())
          : Column(
              children: [
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
                      controller: _search,
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
                  onPressed: onSearch,
                  child: const Text("Search"),
                ),
                userMap!=null ? ListTile(
                  onTap: (){},
                  leading:const Icon(Icons.person, color: Colors.black,),
                  title: Text(userMap!['name']),
                  subtitle: Text(userMap!['email']),
                  trailing:const Icon(Icons.chat),
                ): Container(),
              ],
            ),
    );
  }

  // Widget chatTitle(Size size){
  //   return Container(
  //     height: size.height / 12,
  //     width: size.width / 1.2,
  //     child:  Row(
  //       children: [

  //       ],
  //     ),
  //   );
  // }
}
