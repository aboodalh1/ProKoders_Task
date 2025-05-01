import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prokoders_login_task/core/util/styles.dart';
import 'package:prokoders_login_task/features/items/provider/items_provider.dart';
import 'package:prokoders_login_task/core/widgets/custom_error_widget.dart';
import 'package:prokoders_login_task/features/items/view/widgets/item_card.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key, required this.provider});

  final ItemProvider provider;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: provider.scrollController,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'All Items',
                  style: AppStyles.allertaStencilSemiBold15(
                    context,
                  ).copyWith(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: provider.items.length,
                itemBuilder: (_, index) {
                  final item = provider.items[index];
                  return ItemCard(item: item);
                },
              ),
            ),
            provider.loadMoreState.isLoading
                ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Center(
                    child: CircularProgressIndicator(color: Colors.black),
                  ),
                )
                : provider.moreItemError != null
                ? CustomErrorWidget(
                  error: provider.moreItemError!,
                  onTap: () {
                    provider.fetchMoreItems();
                  },
                )
                : Container(),
          ],
        ),
      ),
    );
  }
}
