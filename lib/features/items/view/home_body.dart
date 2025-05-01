import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prokoders_login_task/features/items/provider/items_provider.dart';
import 'package:prokoders_login_task/features/items/view/widgets/item_card.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.provider,
  });

  final ItemProvider provider;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: provider.scrollController,
      child: Column(
        children: [
          SizedBox(
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: provider.items.length,
              itemBuilder: (_, index) {
                final item = provider.items[index];
                return ItemCard(item: item);
              },
            ),
          ),
          provider.isLoadingMore
              ? Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Center(child: CircularProgressIndicator(color: Colors.black,)),
              )
              : Container(),
        ],
      ),
    );
  }
}
