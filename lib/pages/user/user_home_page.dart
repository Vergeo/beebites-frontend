import 'package:flutter/material.dart';
import 'package:frontend/widgets/glass_card.dart';
import 'package:frontend/widgets/user/user_search_bar.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserSearchBar(),
              Padding(padding: EdgeInsetsGeometry.directional(top: 26)),
              
              Padding(
                padding: EdgeInsetsGeometry.directional(start: 10),
                child: Text("All", textAlign: TextAlign.left,),
              ),

              Padding(
                padding: EdgeInsetsGeometry.directional(top: 21),
                child: GlassCard(
                  height: 150,
                  child: Row(
                    children: [
                       Text("Hello")
                    ],
                  )
                ) ,
              )
              
            ]
            ,
          ),
        ),
      ),
    );
  }
}