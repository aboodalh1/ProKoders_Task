import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prokoders_login_task/features/items/view/home_body.dart';
import 'package:prokoders_login_task/features/items/view/widgets/custom_error_widget.dart';
import 'package:prokoders_login_task/features/items/view/widgets/custom_floating_button.dart';
import 'package:prokoders_login_task/features/items/view/widgets/sign_out_button.dart';
import 'package:provider/provider.dart';
import '../provider/items_provider.dart';
 
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ItemProvider>(context);
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor:  const Color(0xffFFFFFF),
        appBar: AppBar(title: Text('Items List',style: GoogleFonts.inter(color: Colors.white),), 
         backgroundColor: Colors.black,
          elevation: 0, 
          actions: [ 
           SignOutButton(itemProvider: provider)],
        ),
        body: Builder(
          builder: (_) {
            if (provider.isLoading) {
              return Center(child: CircularProgressIndicator(color: Colors.black,));
            } else if (provider.error != null) {
              return CustomErrorWidget(provider: provider);
            } else {
              return HomeBody(provider: provider);
            }
          },
        ),
        floatingActionButton: CustomFloatingButton(),
      ),
    );
  }
}

