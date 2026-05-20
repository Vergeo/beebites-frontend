import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/views/pages/tenant/tenant_edit_profile_info_page.dart';
import 'package:frontend/views/pages/tenant/tenant_manage_product_page.dart';
import 'package:frontend/views/widgets/glass_container_widget.dart';

class TenantProfilePage extends StatefulWidget {
  const TenantProfilePage({super.key});

  @override
  State<TenantProfilePage> createState() => _TenantProfilePageState();
}

class _TenantProfilePageState extends State<TenantProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BeeStyle.white,
      body: SingleChildScrollView(
        child: Column(
          spacing: 15,
          children: [
            Row(
              children: [
                Expanded(
                  child:
                  Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Yishonaya", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),),
                      Row(
                        spacing: 10,
                        children: [
                          Container(
                            width: 85,
                            height: 23,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(75, 255, 226, 157)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.star, color: Color.fromRGBO(255, 111, 0, 100), size: 14,),
                                Text("5.0 (200)",
                                 style: TextStyle(
                                  fontSize: 12
                                 ),
                                )
                              ],
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              text: "See Your Review",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 10
                              ) 
                            )
                          ),
                        ],
                      ),
                    ],
                  )
                ),
                Image.asset("assets/images/yishonaya.png", width: 85, height: 85,)
              ],
            ),

            GlassContainerWidget(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute<void>(builder: (context)=> const TenantManageProductPage())
                );
              },
              child: Text("Manage Products", style: TextStyle(fontSize: 10),)
            ),
            
            GlassContainerWidget(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute<void>(builder: (context)=> const TenantEditProfileInfoPage())
                );
              },
              child: Text("Edit Tenant Information", style: TextStyle(fontSize: 10),)
            ),

          ],
        ),
      ),
    );
  }
}