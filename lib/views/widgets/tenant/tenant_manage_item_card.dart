import 'package:flutter/material.dart';
import 'package:frontend/models/menus.dart';
import 'package:frontend/models/notifiers.dart';
import 'package:frontend/views/pages/tenant/tenant_edit_item_page.dart';
import 'package:frontend/views/widgets/glass_container_widget.dart';

class TenantManageItemCard extends StatefulWidget {
  final Menu menu;
  const TenantManageItemCard({super.key, required this.menu});

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
            padding: EdgeInsetsGeometry.all(0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => TenantEditItemPage(menu: widget.menu),
                ),
              );
            },
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    child: Image.network(
                      widget.menu.menuImage,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsetsGeometry.all(8),
                    child: GlassContainerWidget(
                      height: 30,
                      width: 30,
                      borderRadius: 1000,
                      padding: EdgeInsetsGeometry.all(0),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (context) =>
                                TenantEditItemPage(menu: widget.menu),
                          ),
                        );
                      },
                      child: Center(
                        child: Icon(Icons.edit, color: Colors.black, size: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.menu.menuName, style: const TextStyle(fontSize: 14)),

            Text(
              currencyNotifier.value.format(widget.menu.menuPrice),
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ],
    );
  }
}
