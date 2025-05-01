import 'package:flutter/material.dart';
import 'package:prokoders_login_task/core/widgets/custom_button.dart';
import '../../provider/items_provider.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.provider});

  final ItemProvider provider;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text(provider.error!)),
        CustomButton(provider: provider),
      ],
    );
  }
}
