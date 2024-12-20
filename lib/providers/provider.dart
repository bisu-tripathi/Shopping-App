import 'package:flutter_riverpod/flutter_riverpod.dart';

//stateprovider to hold the current index of bottom navigation
final bottomNavIndexProvider = StateProvider<int>((ref) => 0);