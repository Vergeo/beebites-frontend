import 'package:flutter/material.dart';
import 'package:frontend/models/menus.dart';
import 'package:frontend/services/menu_service.dart';
import 'package:frontend/views/widgets/user/tenant_food_item.dart';

class MenuList extends StatefulWidget {
  final int tenantId;
  final String filter;

  const MenuList({super.key, required this.tenantId, required this.filter});

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  List<Menu>? menus;
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    loadMenus();
  }

  @override
  void didUpdateWidget(covariant MenuList oldWidget) {
    super.didUpdateWidget(oldWidget);
    loadMenus();
  }

  void loadMenus() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      var data;
      if (widget.filter.isEmpty) {
        data = await MenuService.getAllMenusFromTenant(widget.tenantId);
      } else {
        data = await MenuService.searchMenu(widget.tenantId, widget.filter);
      }
      setState(() {
        menus = data;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        errorMessage = error.toString();
        isLoading = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage!),
            backgroundColor: Colors.redAccent,
            action: SnackBarAction(
              label: "RETRY",
              textColor: Colors.white,
              onPressed: loadMenus,
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return CircularProgressIndicator();
    }
    if (errorMessage != null && menus == null) {
      return Center(child: Text("$errorMessage"));
    }
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      crossAxisSpacing: 32,
      mainAxisSpacing: 32,
      childAspectRatio: 5 / 6,
      physics: const NeverScrollableScrollPhysics(),
      children: menus!.map((menu) {
        return TenantFoodItem(menu: menu);
      }).toList(),
    );
  }
}
