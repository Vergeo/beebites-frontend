import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/models/tenant.dart';
import 'package:frontend/services/tenant_service.dart';
import 'package:frontend/views/pages/tenant/tenant_widget_tree.dart';
import 'package:frontend/views/widgets/glass_container_widget.dart';
import 'package:frontend/views/widgets/glass_text_field_widget.dart';

class EditTenant extends StatefulWidget {
  final Tenant tenant;
  const EditTenant({super.key, required this.tenant});

  @override
  State<EditTenant> createState() => _EditTenantState();
}

class _EditTenantState extends State<EditTenant> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController openController = TextEditingController();
  final TextEditingController closeController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.tenant.tenantName;
    descController.text = widget.tenant.tenantDescription;
    openController.text = widget.tenant.tenantOpenTime;
    closeController.text = widget.tenant.tenantCloseTime;
    imageController.text = widget.tenant.tenantLogo;
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    descController.dispose();
    openController.dispose();
    closeController.dispose();
    imageController.dispose();
  }

  void save() async {
    try {
      await TenantService.updateTenant(
        widget.tenant.tenantId,
        nameController.text,
        descController.text,
        imageController.text,
        openController.text,
        closeController.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(builder: (context) => TenantWidgetTree()),
      );
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.toString()),
            // content: Text("Fields can't be empty!"),
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Tenant Name"),
            GlassTextFieldWidget(
              height: 50,
              hintText: "My Pizza Place",
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
            Text("Tenant Description"),
            GlassTextFieldWidget(
              height: 50,
              hintText: "A beautiful pizza place",
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
            Text("Open Hour"),
            GlassTextFieldWidget(
              height: 50,
              hintText: "08:00",
              controller: openController,
              hintTextColor: BeeStyle.gray,
              style: TextStyle(color: BeeStyle.black, fontSize: 12),
            ),
          ],
        ),
        Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Close Hour"),
            GlassTextFieldWidget(
              height: 50,
              hintText: "17:00",
              controller: closeController,
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
        GlassContainerWidget(
          padding: EdgeInsetsGeometry.symmetric(vertical: 8, horizontal: 32),
          borderRadius: 100,
          fillColor: BeeStyle.green,
          onTap: save,
          child: Text("Save", style: TextStyle(fontSize: 12)),
        ),
      ],
    );
  }
}
