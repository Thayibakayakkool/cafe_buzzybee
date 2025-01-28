import 'package:cafe_buzzybee/src/core/common/widgets/custom_circular_progress_widget.dart';
import 'package:cafe_buzzybee/src/core/config/constants.dart';
import 'package:flutter/material.dart';

class LoadingColumnWidget extends StatelessWidget {
  const LoadingColumnWidget({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomCircularProgressWidget(),
        kSizedBox10,
        Text('$message....')
      ],
    );
  }
}