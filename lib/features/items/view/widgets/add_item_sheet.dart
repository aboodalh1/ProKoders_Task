import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prokoders_login_task/core/util/styles.dart';
import 'package:prokoders_login_task/core/widgets/my_button.dart';
import 'package:prokoders_login_task/core/widgets/my_text_field.dart';
import 'package:prokoders_login_task/features/items/provider/items_provider.dart';
import 'package:provider/provider.dart';

class AddItemSheet extends StatefulWidget {
  const AddItemSheet({super.key});

  @override
  State<AddItemSheet> createState() => _AddItemSheetState();
}

class _AddItemSheetState extends State<AddItemSheet> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ItemProvider>(context, listen: true);

    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        left: 15.w,
        right: 15.w,
        top: 20.h,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Add New Item",
                  style: GoogleFonts.allertaStencil(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.keyboard_arrow_down, size: 30.sp),
                ),
              ],
            ),
            SizedBox(height: 18.h),
            Text(
              "Item Title",
              style: AppStyles.allertaStencilSemiBold15(context),
            ),
            SizedBox(height: 10.h),
            MyTextField(
              controller: titleController,
              hintText: "Enter title",
              obsecureText: false,
            ),
            SizedBox(height: 20.h),
            Text(
              "Item Description",
              style: AppStyles.allertaStencilSemiBold15(context),
            ),
            SizedBox(height: 10.h),
            MyTextField(
              controller: descriptionController,
              hintText: "Enter description",
              obsecureText: false,
            ),
            SizedBox(height: 20.h),
            if (provider.addItemError != null) Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(provider.addItemError!,style: AppStyles.allertaStencilNormal15(context),),
            ),
            provider.isAddItemLoading
                ? Center(child: CircularProgressIndicator(color: Colors.black))
                : MyButton(
                  text: "Submit",
                  onTap: () async {
                    await provider.addItem(
                      context,
                      title: titleController.text.trim(),
                      description: descriptionController.text.trim(),
                    );
                  },
                ),
          ],
        ),
      ),
    );
  }
}
