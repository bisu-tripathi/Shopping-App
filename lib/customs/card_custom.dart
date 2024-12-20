import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'app_colors_custom.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.img,
    required this.name,
    required this.price,
    this.rating,
    this.sold,
    this.discount,
    this.reviewCount,
    this.dealStartTime,
    this.dealEndTime,
  });

  final String img;
  final String name;
  final double price;
  final double? discount;
  final double? rating;
  final int? sold;
  final int? reviewCount;
  final DateTime? dealStartTime;
  final DateTime? dealEndTime;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: InkWell(
        onTap: () {
          //go to another page
        },
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //image
              Expanded(
                child: Image.network(
                  img,
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name),
                    Row(
                      children: [
                        Text(
                          'Rs.$price ',
                          style: const TextStyle(
                              color: MyAppColors.amountColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          color: Colors.pink.withOpacity(0.2),
                          child: Text(
                            '-$discount%',
                            style: TextStyle(fontSize: 12.sp),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star,
                            size: 1.8.h, color: MyAppColors.starColor),
                        SizedBox(width: 1.w),
                        Text(
                          '$rating (${reviewCount ?? 0}) $sold sold',
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const Spacer(),
                        CircleAvatar(
                          radius: 1.5.h,
                          backgroundColor: MyAppColors.primaryColor,
                          child: Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                            size: 1.8.h,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
