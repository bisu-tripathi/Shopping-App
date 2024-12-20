import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../customs/app_colors_custom.dart';
import '../customs/card_custom.dart';
import '../customs/drawer_custom.dart';
import '../models/tab_heading_model.dart';
import 'all_categories_page.dart';

final currentPageProvider = StateProvider<int>((ref) => 0);

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController pageController = PageController();
    final currentPage = ref.watch(currentPageProvider);

    int itemCount = 12;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Gradient background with PageView and dots
            Stack(
              alignment: Alignment.center,
              children: [
                // behind banner image (gradient container)
                Container(
                  height: 20.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        MyAppColors.primaryColor,
                        MyAppColors.primaryColor.withOpacity(0),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                // banner image
                Positioned(
                  top: 0.5.h,
                  child: SizedBox(
                    height: 18.h,
                    width: 100.w,
                    child: PageView.builder(
                      controller: pageController,
                      onPageChanged: (index) {
                        ref.read(currentPageProvider.notifier).state = index;
                      },
                      itemCount: itemCount,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                                'https://picsum.photos/250?image=$index'));
                      },
                    ),
                  ),
                ),
                //dot indicators
                Positioned(
                  bottom: 1.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(itemCount, (index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: 1.w),
                        width: currentPage == index ? 2.h : 1.h,
                        height: 1.h,
                        decoration: BoxDecoration(
                          color: currentPage == index
                              ? MyAppColors.selectedIndicatorColor
                              : MyAppColors.unselectedIndicatorColor,
                          shape: BoxShape.circle,
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  const Text('Categories'),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AllCategoriesPage()));
                    },
                    child: const Text('All Categories'),
                  ),
                ],
              ),
            ),
            const CustomTabs(),
          ],
        ),
      ),
    );
  }
}

///
class CustomTabs extends StatefulWidget {
  const CustomTabs({super.key});

  @override
  State<CustomTabs> createState() => _CustomTabsState();
}

class _CustomTabsState extends State<CustomTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabHeadings.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Tabs
        TabBar(
          isScrollable: true,
          indicatorColor: MyAppColors.primaryColor,
          labelColor: MyAppColors.primaryColor,
          tabAlignment: TabAlignment.start,
          controller: _tabController,
          tabs: tabHeadings
              .map((tabHeading) => Tab(
                    child: Row(
                      children: [
                        tabHeading.icon,
                        SizedBox(width: 1.w),
                        Text(tabHeading.categoryName),
                      ],
                    ),
                  ))
              .toList(),
        ),
        // Tab Bar View
        SizedBox(
          height: 70.h,
          child: TabBarView(
            controller: _tabController,
            children: List.generate(
              tabHeadings.length,
              (index) {
                return TabHeadingWiseProduct(
                  tabIndex: index,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

//products are listed accoring to tab bar headings
class TabHeadingWiseProduct extends ConsumerWidget {
  const TabHeadingWiseProduct({required this.tabIndex, super.key});

  final int tabIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 20,
        itemBuilder: (context, index) {
          return CustomCard(
            img: 'https://picsum.photos/250?image=$index',
            name: 'product name',
            price: 12.0,
            discount: 5.0,
            sold: 123,
            reviewCount: 12,
            dealStartTime: DateTime.now(),
            dealEndTime: DateTime.now(),
          );
        },
      ),
    );
  }
}
