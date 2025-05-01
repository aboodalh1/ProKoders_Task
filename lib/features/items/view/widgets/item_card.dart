import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prokoders_login_task/core/util/navigate_function.dart';
import 'package:prokoders_login_task/core/util/styles.dart';
import 'package:prokoders_login_task/features/items/data/model/product_model.dart';
import 'package:prokoders_login_task/features/items/view/item_details.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.item,
  });
 
  final Products item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
      navigateTo(context, ItemDetails(image: item.images![0],
          title: item.title!, description: item.description!));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 7.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r)
        ),
        child: 
         Column( 
            children: [
              FancyShimmerImage(
                imageUrl: item.images![0],
                height: 120.h,
                width: 160.w,
                errorWidget: Icon(Icons.shopify_sharp,size: 120.sp,),
              ),
              SizedBox(height: 10.w),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.38,
                child: Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  item.title!,
                  style: AppStyles.allertaStencilSemiBold15(context)
                ),
              ),
            ],
          ),
      ),
    );
  }
}


