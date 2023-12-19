import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_dev_test_task/constants.dart';

class CustomEmailField extends StatelessWidget {
  const CustomEmailField(
      {super.key, required this.labelText, required this.controller});
  final String labelText;
  final TextEditingController controller;

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isEmpty || !regex.hasMatch(value)
        ? ERROR_VADIDATE_EMAIL
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: labelText,
        ),
        controller: controller,
        validator: validateEmail,
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
