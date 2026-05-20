import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/views/widgets/glass_container_widget.dart';
import 'package:frontend/views/widgets/tenant/tenant_manage_item_card.dart';

class TenantManageProductPage extends StatefulWidget {
  const TenantManageProductPage({super.key});

  @override
  State<TenantManageProductPage> createState() => _TenantManageProductPageState();
}

class _TenantManageProductPageState extends State<TenantManageProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BeeStyle.white,
      appBar: AppBar(title: Text("Manage Product"),backgroundColor: BeeStyle.white,),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              GlassContainerWidget(
                width: 108,
                height: 22,
                padding: EdgeInsets.all(0),
                child: Center(child: Text("Add Products", style: TextStyle(fontSize: 10),)),
                onTap: () {
                  
                },
              ),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 5 / 6,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  TenantManageItemCard(),
                  TenantManageItemCard(),
                  TenantManageItemCard(),
                  TenantManageItemCard(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}