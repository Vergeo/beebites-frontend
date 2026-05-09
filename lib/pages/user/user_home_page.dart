import 'package:flutter/material.dart';
import 'package:frontend/data/bee_style.dart';
import 'package:frontend/widgets/glass_card_widget.dart';
import 'package:frontend/widgets/user/user_search_bar_widget.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BeeStyle.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 16.0,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hi, User", style: TextStyle(fontSize: 24),),
                  Text("Ready when you are.", style: TextStyle(fontSize: 24),),
                ],
              ),
              // Text("Ready when you are."),

              UserSearchBarWidget(),

              Text("All", textAlign: TextAlign.left),

              GlassCardWidget(
                height: 115,
                dark: true,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/images/yishonaya.png",
                          width: 75,
                          height: 75,
                        ), 
                    ),

                    const SizedBox(width: 18),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Yishonaya", 
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(width: 90),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Color.fromARGB(255, 255, 226, 157),
                              ),
                              width: 50,
                              height: 23,

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.star, size: 15, color: Color.fromARGB(255, 255, 102, 0),),
                                  SizedBox(width: 1,),
                                  Text("5.0")
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.access_time_sharp, size: 16,),
                            const SizedBox(width: 7,),
                            Text("5 min", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300))
                          ],
                        )
                      ],
                    ),
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
