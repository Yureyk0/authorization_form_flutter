import 'package:flutter/material.dart';
import 'package:mobile_dev_test_task/componets/email_field.dart';
import 'package:mobile_dev_test_task/componets/send_btn.dart';
import 'package:mobile_dev_test_task/componets/text_field.dart';
import 'package:mobile_dev_test_task/constants.dart';

class TestTaskScreen extends StatefulWidget {
  const TestTaskScreen({super.key, required this.title});

  final String title;

  @override
  State<TestTaskScreen> createState() => _TestTaskScreenState();
}

class _TestTaskScreenState extends State<TestTaskScreen> {
  bool _enableBtn = false;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => {},
        ),
      ),
      body: Form(
        key: _formKey,
        onChanged: () =>
            setState(() => _enableBtn = _formKey.currentState!.validate()),
        child: ListView(
          padding: const EdgeInsets.all(12),
          children: [
            CustomTextField(labelText: NAME, controller: _nameController),
            CustomEmailField(labelText: EMAIL, controller: _emailController),
            CustomTextField(labelText: MESSAGE, controller: _messageController),
            const SizedBox(
              height: 45,
            ),
            SendBtn(
              enabled: _enableBtn,
              controllers: {
                "name": _nameController,
                "email": _emailController,
                "message": _messageController,
              },
            )
          ],
        ),
      ),
    );
  }

  void clearFormCallback() {
    _nameController.clear();
    _emailController.clear();
    _messageController.clear();
  }
}
