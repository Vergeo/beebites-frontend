import 'package:flutter/material.dart';
import 'package:frontend/views/pages/tenant/tenant_edit_item_page.dart';
import 'package:frontend/views/widgets/glass_container_widget.dart';

class TenantManageItemCard extends StatefulWidget {
  const TenantManageItemCard({super.key});

  @override
  State<TenantManageItemCard> createState() => _TenantManageItemCardState();
}

class _TenantManageItemCardState extends State<TenantManageItemCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: GlassContainerWidget(
            // height: 160,
            // width: 180,
            // padding: const EdgeInsets.all(5),
            // dark: true,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/yishonaya.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ],          
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute<void>(builder: (context)=> const TenantEditItemPage()));
            },        
          ),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "name", 
              style: const TextStyle(
                fontSize: 14
              )
            ),
            
            Text(
              "price",
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        
      ],
    );
  }
}