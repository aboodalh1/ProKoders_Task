
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prokoders_login_task/features/items/view/widgets/add_item_sheet.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.black,
      onPressed: () { 
        showModalBottomSheet(
          isScrollControlled: true,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0))),
          context: context, builder: (context){
          return Padding(padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom, // <<=== حتى يبعد عن الكيبورد
      ),
            child: AddItemSheet(),
          );
        });
      }, 
      child: Icon(Icons.add,color: Colors.white,size: 28.sp,),
    );
  }
}
