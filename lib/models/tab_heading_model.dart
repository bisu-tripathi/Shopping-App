import 'package:flutter/material.dart';

//Tab heading model
class TabHeadingsModel {
  final String categoryName;
  final Icon icon;

  TabHeadingsModel({required this.categoryName, required this.icon});
}

//list of tab heading
final List<TabHeadingsModel> tabHeadings = [
  TabHeadingsModel(
    categoryName: 'For You',
    icon: const Icon(Icons.person),
  ),
  TabHeadingsModel(
    categoryName: 'Hot Deals',
    icon: const Icon(Icons.local_fire_department),
  ),
  TabHeadingsModel(
    categoryName: 'Free Delivery',
    icon: const Icon(Icons.local_shipping),
  ),
  TabHeadingsModel(
    categoryName: 'Must Buy',
    icon: const Icon(Icons.shopping_cart),
  ),
  TabHeadingsModel(
    categoryName: 'New Arrivals',
    icon: const Icon(Icons.new_releases),
  ),
];
