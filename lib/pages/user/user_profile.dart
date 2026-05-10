import 'package:flutter/material.dart';
import 'package:frontend/data/bee_style.dart';
import 'package:frontend/widgets/glass_card_widget.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BeeStyle.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 25), 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Your Profile", style: TextStyle(fontSize: 24)),
              Row(
                children: [
                  const SizedBox(height: 167),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100)
                    ),
                    child: Image.asset('assets/images/herta.png'),
                  ),
                  const SizedBox(width: 25),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Madam Herta", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                      Text("kurukuru@herta.com", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400))
                    ],
                  ),
                ],
              ),
              Text("General", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
              const SizedBox(height: 11,),
              GlassCardWidget(
                padding: EdgeInsetsGeometry.only(left: 20, top: 5),
                height: 30,
                width: double.infinity,
                dark: true,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Account Information", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),)
                  ],
                )
              ),

              const SizedBox(height: 11,),
              GlassCardWidget(
                padding: EdgeInsetsGeometry.only(left: 20, top: 5),
                height: 30,
                width: double.infinity,
                dark: true,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Settings", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),)
                  ],
                )
              ),

              const SizedBox(height: 20,),

              Text("Support", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
              const SizedBox(height: 11,),
              GlassCardWidget(
                padding: EdgeInsetsGeometry.only(left: 20, top: 5),
                height: 30,
                width: double.infinity,
                dark: true,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Help Centre", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),)
                  ],
                )
              ),

              const SizedBox(height: 11,),
              GlassCardWidget(
                padding: EdgeInsetsGeometry.only(left: 20, top: 5),
                height: 30,
                width: double.infinity,
                dark: true,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Feedback", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),)
                  ],
                )
              ),

              const SizedBox(height: 20,),

              Text("Others", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
              const SizedBox(height: 11,),
              GlassCardWidget(
                padding: EdgeInsetsGeometry.only(left: 20, top: 5),
                height: 30,
                width: double.infinity,
                dark: true,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Register as Tenant", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),)
                  ],
                )
              ),

            ],
          ),
        ) 
        
      ),
    );
  }
}