import 'package:chat_fire/constant/constant.dart';
import 'package:chat_fire/model/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  ScrollController _scrollController = new ScrollController();

  TextEditingController controller = TextEditingController();
  CollectionReference Messages =
      FirebaseFirestore.instance.collection('Message');

  static String id = "chat";

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: Messages.orderBy('time', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Messagemodel> messagelist = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagelist.add(
              Messagemodel.fromjson(snapshot.data!.docs[i]),
            );
          }
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              // centerTitle: true,
              backgroundColor: kprimarycolor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/scholar.png",
                    height: 64,
                    width: 64,
                  ),
                  Text(
                    "Chat",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _scrollController,
                    itemCount: messagelist.length,
                    itemBuilder: (context, index) {
                      return messagelist[index].id == email
                          ? chat_bubble(messagemodel: messagelist[index])
                          : chat_reciecd_bubble(
                              messagemodel: messagelist[index]);
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (value) {
                      Messages.add(
                        {'message': value, 'time': DateTime.now(), 'id': email},
                      );
                      controller.clear();
                      _scrollController.animateTo(
                        0,
                        curve: Curves.easeOut,
                        duration: const Duration(milliseconds: 500),
                      );
                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(16),
                        suffixIcon: IconButton(
                            onPressed: () {
                              Messages.add(
                                {
                                  'message': controller.value.text,
                                  'time': DateTime.now(),
                                  'id': email
                                },
                              );
                              controller.clear();
                              _scrollController.animateTo(
                                0,
                                curve: Curves.easeOut,
                                duration: const Duration(milliseconds: 500),
                              );
                            },
                            icon: Icon(
                              Icons.send,
                              color: kprimarycolor,
                            )),
                        hintText: "Send Message",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: kprimarycolor)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: kprimarycolor))),
                  ),
                )
              ],
            ),
          );
        } else {
          return Text("Loading");
        }
        ;
      },
    );
  }
}
