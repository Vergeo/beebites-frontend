import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/models/menus.dart';
import 'package:frontend/services/menu_service.dart';
import 'package:frontend/views/pages/tenant/tenant_widget_tree.dart';
import 'package:frontend/views/widgets/glass_container_widget.dart';
import 'package:frontend/views/widgets/glass_text_field_widget.dart';

class EditItem extends StatefulWidget {
  final Menu? menu;
  const EditItem({super.key, this.menu});

  @override
  State<EditItem> createState() => _EditItemState();
}

class _EditItemState extends State<EditItem> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.menu != null) {
      nameController.text = widget.menu!.menuName;
      descController.text = widget.menu!.menuDescription;
      priceController.text = widget.menu!.menuPrice.toString();
      imageController.text = widget.menu!.menuImage;
    }
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    descController.dispose();
    priceController.dispose();
    imageController.dispose();
  }

  void create() async {
    try {
      await MenuService.createMenu(
        nameController.text,
        descController.text,
        imageController.text,
        int.parse(priceController.text),
        true,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(builder: (context) => TenantWidgetTree()),
      );
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Fields can't be empty!"),
            backgroundColor: Colors.redAccent,
            action: SnackBarAction(
              label: "RETRY",
              textColor: Colors.white,
              onPressed: create,
            ),
          ),
        );
      }
    }
  }

  void save() async {
    try {
      await MenuService.updateMenu(
        widget.menu!.menuId,
        nameController.text,
        descController.text,
        imageController.text,
        int.parse(priceController.text),
        true,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(builder: (context) => TenantWidgetTree()),
      );
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Fields can't be empty!"),
            backgroundColor: Colors.redAccent,
            action: SnackBarAction(
              label: "RETRY",
              textColor: Colors.white,
              onPressed: save,
            ),
          ),
        );
      }
    }
  }

  void delete() async {
    try {
      await MenuService.deleteMenu(widget.menu!.menuId);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(builder: (context) => TenantWidgetTree()),
      );
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.toString()),
            backgroundColor: Colors.redAccent,
            action: SnackBarAction(
              label: "RETRY",
              textColor: Colors.white,
              onPressed: delete,
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        if (widget.menu != null)
          ShaderMask(
            shaderCallback: (rect) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, Colors.black, Colors.transparent],
                stops: [0.0, 0.6, 1.0],
              ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
            },
            blendMode: BlendMode.dstIn,
            child: Image.network(
              widget.menu!.menuImage,
              height: 280,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

        Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Item Name"),
            GlassTextFieldWidget(
              height: 50,
              hintText: "Fried Rice",
              controller: nameController,
              hintTextColor: BeeStyle.gray,
              style: TextStyle(color: BeeStyle.black, fontSize: 12),
            ),
          ],
        ),
        Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Item Description"),
            GlassTextFieldWidget(
              height: 50,
              hintText: "A tasty fried rice",
              controller: descController,
              hintTextColor: BeeStyle.gray,
              style: TextStyle(color: BeeStyle.black, fontSize: 12),
            ),
          ],
        ),
        Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Item Price"),
            GlassTextFieldWidget(
              height: 50,
              hintText: "25000",
              controller: priceController,
              hintTextColor: BeeStyle.gray,
              style: TextStyle(color: BeeStyle.black, fontSize: 12),
            ),
          ],
        ),
        Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Item Image Link"),
            GlassTextFieldWidget(
              height: 50,
              hintText: "https://image.link/path.png",
              controller: imageController,
              hintTextColor: BeeStyle.gray,
              style: TextStyle(color: BeeStyle.black, fontSize: 12),
            ),
          ],
        ),
        widget.menu != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 16,
                children: [
                  GlassContainerWidget(
                    padding: EdgeInsetsGeometry.symmetric(
                      vertical: 8,
                      horizontal: 32,
                    ),
                    borderRadius: 100,
                    fillColor: BeeStyle.green,
                    onTap: save,
                    child: Text("Save", style: TextStyle(fontSize: 12)),
                  ),
                  GlassContainerWidget(
                    padding: EdgeInsetsGeometry.symmetric(
                      vertical: 8,
                      horizontal: 32,
                    ),
                    borderRadius: 100,
                    fillColor: BeeStyle.red,
                    onTap: delete,
                    child: Text("Delete", style: TextStyle(fontSize: 12)),
                  ),
                ],
              )
            : Center(
                child: GlassContainerWidget(
                  padding: EdgeInsetsGeometry.symmetric(
                    vertical: 8,
                    horizontal: 32,
                  ),
                  borderRadius: 100,
                  fillColor: BeeStyle.green,
                  onTap: create,
                  child: Text("Create Item", style: TextStyle(fontSize: 12)),
                ),
              ),
      ],
    );
  }
}
