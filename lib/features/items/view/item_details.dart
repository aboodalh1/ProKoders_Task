import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prokoders_login_task/core/util/styles.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Item Details')),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            FancyShimmerImage(imageUrl: image,  errorWidget: Icon(Icons.shopify_sharp,size: 120.sp,),),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.9,
                  child: Text
                                (
                    textAlign: TextAlign.start,
                    title,
                    style: AppStyles.interMedium20(context)
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Text(
                  "Item Description",
                  style: AppStyles.interNormal20(context).copyWith(color: Colors.grey)
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.9,
                  child: Text(  
                    description, style: AppStyles.allertaStencilNormal15(context)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
