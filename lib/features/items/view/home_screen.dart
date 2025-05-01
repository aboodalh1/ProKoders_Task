import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prokoders_login_task/features/items/view/home_body.dart';
import 'package:prokoders_login_task/core/widgets/custom_error_widget.dart';
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
        appBar: AppBar(
          title: Text(
            'Prokoders shop',
            style: GoogleFonts.inter(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.black,
          elevation: 0,
          actions: [SignOutButton(itemProvider: provider)],
        ),
        body: Builder( 
          builder: (_) {
            if (provider.itemsState.isLoading) {
              return Center(
                child: CircularProgressIndicator(color: Colors.black),
              );
            } else if (provider.error != null) {
              return CustomErrorWidget(
                error: provider.error!,
                onTap: () {
                  provider.fetchItems();
                },
              );
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
