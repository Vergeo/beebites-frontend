import 'package:flutter/material.dart';
import 'package:frontend/models/cart.dart';
import 'package:frontend/models/tenant.dart';
import 'package:frontend/models/user.dart';
import 'package:intl/intl.dart';

ValueNotifier<int> selectedPageNotifier = ValueNotifier(0);
ValueNotifier<List<Cart>> cartNotifier = ValueNotifier([]);
ValueNotifier<int?> selectedTenantNotifier = ValueNotifier(null);
ValueNotifier<User?> currentUserNotifier = ValueNotifier(null);
ValueNotifier<NumberFormat> currencyNotifier = ValueNotifier(
  NumberFormat.currency(locale: "id_ID", decimalDigits: 0, symbol: "Rp "),
);
ValueNotifier<String> jwtNotifier = ValueNotifier("");
