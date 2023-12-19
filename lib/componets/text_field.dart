import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_dev_test_task/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.labelText, required this.controller});
  final String labelText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
        ),
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return ERROR_VADIDATE_TEXT;
          }
          return null;
        },
      ),
      leading: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color.fromARGB(255, 255, 245, 233),
        ),
        child: SvgPicture.asset(
          'assets/svg/lock.svg',
          colorFilter: const ColorFilter.mode(
            Color.fromARGB(255, 229, 190, 144),
            BlendMode.srcIn,
          ),
          height: 18,
          width: 18,
        ),
      ),
    );
  }
}
