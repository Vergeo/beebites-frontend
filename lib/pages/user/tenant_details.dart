import 'package:flutter/material.dart';
import 'package:frontend/data/bee_style.dart';
import 'package:frontend/widgets/glass_card_widget.dart';
import 'package:frontend/widgets/user/tenant_food_item.dart';
import 'package:frontend/widgets/user/user_search_bar_widget.dart';

class TenantDetails extends StatefulWidget {
  const TenantDetails({super.key});

  @override
  State<TenantDetails> createState() => _TenantDetailsState();
}

class _TenantDetailsState extends State<TenantDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsetsGeometry.only(
          top: 32,
          left: 16,
          right: 16,
          bottom: 16,
        ),
        color: BeeStyle.white,
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BackButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Yishonoya",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          spacing: 8,
                          children: [
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color.fromARGB(255, 255, 226, 157),
                              ),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 15,
                                    color: Color.fromARGB(255, 255, 102, 0),
                                  ),
                                  SizedBox(width: 1),
                                  Text("5.0 (200)"),
                                ],
                              ),
                            ),
                            Text(
                              "See All Review",
                              style: TextStyle(
                                color: BeeStyle.lightBlack,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/images/yishonaya.png",
                    width: 75,
                    height: 75,
                  ),
                ],
              ),
              UserSearchBarWidget(hintText: "Search Menu"),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 5 / 6,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  TenantFoodItem(
                    name: "Original Yakiniku", 
                    price: "Rp 58.151", 
                    imagePath: "assets/images/yishonaya.png", 
                    // onAddTap: onAddTap
                  ),

                  TenantFoodItem(
                    name: "Original Yakiniku", 
                    price: "Rp 58.151", 
                    imagePath: "assets/images/yishonaya.png", 
                    // onAddTap: onAddTap
                  ),

                  TenantFoodItem(
                    name: "Original Yakiniku", 
                    price: "Rp 58.151", 
                    imagePath: "assets/images/yishonaya.png", 
                    // onAddTap: onAddTap
                  ),

                  TenantFoodItem(
                    name: "Original Yakiniku", 
                    price: "Rp 58.151", 
                    imagePath: "assets/images/yishonaya.png", 
                    // onAddTap: onAddTap
                  ),

                  TenantFoodItem(
                    name: "Original Yakiniku", 
                    price: "Rp 58.151", 
                    imagePath: "assets/images/yishonaya.png", 
                    // onAddTap: onAddTap
                  ),

                  TenantFoodItem(
                    name: "Original Yakiniku", 
                    price: "Rp 58.151", 
                    imagePath: "assets/images/yishonaya.png", 
                    // onAddTap: onAddTap
                  ),

                  TenantFoodItem(
                    name: "Original Yakiniku", 
                    price: "Rp 58.151", 
                    imagePath: "assets/images/yishonaya.png", 
                    // onAddTap: onAddTap
                  ),

                  TenantFoodItem(
                    name: "Original Yakiniku", 
                    price: "Rp 58.151", 
                    imagePath: "assets/images/yishonaya.png", 
                    // onAddTap: onAddTap
                  ),

                  TenantFoodItem(
                    name: "Original Yakiniku", 
                    price: "Rp 58.151", 
                    imagePath: "assets/images/yishonaya.png", 
                    // onAddTap: onAddTap
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
