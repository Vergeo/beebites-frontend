import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/views/widgets/user/user_history_widget.dart';

class UserHistory extends StatefulWidget {
  const UserHistory({super.key});

  @override
  State<UserHistory> createState() => _UserHistoryState();
}

class _UserHistoryState extends State<UserHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BeeStyle.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Order History", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),
          const SizedBox(height: 20,),
          UserHistoryWidget(name: "Yishonaya", status: "In Process", imagePath: "assets/images/yishonaya.png",),
          const SizedBox(height: 24,),
          UserHistoryWidget(name: "Yishonaya", status: "Completed", imagePath: "assets/images/yishonaya.png",),
          const SizedBox(height: 24,),
          UserHistoryWidget(name: "Yishonaya", status: "Cancelled", imagePath: "assets/images/yishonaya.png",)
        ],
      ),
    );
  }
}