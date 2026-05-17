import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/viewmodels/user/tenant_detail_header.dart';
import 'package:frontend/views/widgets/glass_card_widget.dart';
import 'package:frontend/views/widgets/tenant/tenant_order_card_widget.dart';

class TenantOrderPage extends StatefulWidget {
  const TenantOrderPage({super.key,});

  @override
  State<TenantOrderPage> createState() => _TenantOrderPageState();
}

class _TenantOrderPageState extends State<TenantOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BeeStyle.white,
      body: SingleChildScrollView(
        child: Column(
          spacing: 15,
          crossAxisAlignment: CrossAxisAlignment.start,
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

            Row(
              spacing: 10,
              children: [
                GlassCardWidget(
                  width: 110,
                  height: 23,
                  padding: EdgeInsetsGeometry.all(0),
                  dark: true,
                  onTap: () {
                    
                  },
                  child: Center(child: Text("Manage Products", style: TextStyle(fontSize: 10),))
                ),
                GlassCardWidget(
                  width: 65,
                  height: 23,
                  padding: EdgeInsetsGeometry.all(0),
                  dark: true,
                  onTap: () {
                    
                  },
                  child: Center(child: Text("Edit Info", style: TextStyle(fontSize: 10),))
                )
              ],
            ),
            Text("Next Order (0)"),
            
            TenantOrderCardWidget(itemName: "Yishonaya", notes: "Nothing", orderId: 0001)
          ],
        ),
      ),
    );
  }
}