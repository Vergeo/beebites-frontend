import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/views/widgets/glass_card_widget.dart';
import 'package:frontend/views/widgets/glass_container_widget.dart';
import 'package:frontend/views/widgets/glass_text_field_widget.dart';

class TenantEditProfileInfoPage extends StatefulWidget {
  const TenantEditProfileInfoPage({super.key});

  @override
  State<TenantEditProfileInfoPage> createState() => _TenantEditProfileInfoPageState();
}

class _TenantEditProfileInfoPageState extends State<TenantEditProfileInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BeeStyle.white,
      appBar: AppBar(title: Text("Edit Info", ), backgroundColor: BeeStyle.white,),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            spacing: 10,
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/yishonaya.png"),
                ],
              ),
              GlassContainerWidget(
                width: 105,
                height: 22,
                padding: EdgeInsets.all(0),
                child: Center(child: Text("Upload Image", style: TextStyle(fontSize: 10),)),
                onTap: () {
                  
                },
              ),
                
              Text("Tenant"),
              GlassTextFieldWidget(hintText: "name", controller: TextEditingController(),),

              Text("Operational Hours"),
              GlassTextFieldWidget(hintText: "uh", controller: TextEditingController()),
            ],
          ),
        )
      ),
    );
  }
}