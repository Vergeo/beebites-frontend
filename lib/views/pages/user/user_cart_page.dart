import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/services/cart_service.dart';
import 'package:frontend/viewmodels/user/cart_list.dart';
import 'package:frontend/views/widgets/user/user_cart_item.dart';

class UserCartPage extends StatefulWidget {
  const UserCartPage({super.key});

  @override
  State<UserCartPage> createState() => _UserCartPageState();
}

class _UserCartPageState extends State<UserCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: BeeStyle.white, body: CartList());
  }
}
