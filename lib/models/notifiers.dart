import 'package:flutter/material.dart';
import 'package:frontend/models/cart.dart';
import 'package:frontend/models/tenant.dart';
import 'package:frontend/models/user.dart';

ValueNotifier<int> selectedPageNotifier = ValueNotifier(0);
ValueNotifier<List<Cart>> cartNotifier = ValueNotifier([]);
ValueNotifier<int?> selectedTenantNotifier = ValueNotifier(null);
ValueNotifier<User?> currentUserNotifier = ValueNotifier(null);
