import 'package:flutter/material.dart';
import 'package:frontend/models/cart.dart';

ValueNotifier<int> selectedPageNotifier = ValueNotifier(0);
ValueNotifier<List<Cart>> cartNotifier = ValueNotifier([]);
