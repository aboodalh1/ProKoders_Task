import 'package:flutter/material.dart';
import 'package:prokoders_login_task/features/items/provider/items_provider.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.provider});

  final ItemProvider provider;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.black),
        foregroundColor: WidgetStateProperty.all(Colors.white),
      ),
      onPressed: () => provider.fetchItems(),
      child: Text('Retry'),
    );
  }
}
