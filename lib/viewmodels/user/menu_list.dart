import 'package:flutter/material.dart';
import 'package:frontend/models/menus.dart';
import 'package:frontend/services/menu_service.dart';
import 'package:frontend/views/widgets/user/tenant_food_item.dart';

class MenuList extends StatefulWidget {
  final int tenantId;

  const MenuList({super.key, required this.tenantId});

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MenuService.getAllMenusFromTenant(widget.tenantId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasData) {
          List<Menu> menus = snapshot.data;
          return GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 5 / 6,
            physics: const NeverScrollableScrollPhysics(),
            children: menus.map((menu) {
              return TenantFoodItem(
                name: menu.menuName,
                price: "Rp ${menu.menuPrice}",
                imagePath: "assets/images/yishonaya.png",
              );
            }).toList(),
          );
          // return Text("Yes");
        }
        if (snapshot.hasError) {
          return Center(child: Text("${snapshot.error}"));
        }
        return Center(child: Text("Something went wrong. Please try again!"));
      },
    );
  }
}
