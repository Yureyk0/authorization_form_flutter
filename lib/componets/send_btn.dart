import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile_dev_test_task/constants.dart';

class SendBtn extends StatefulWidget {
  const SendBtn({
    super.key,
    required this.enabled,
    required this.controllers,
  });

  final Map<String, TextEditingController> controllers;
  final bool enabled;

  @override
  State<SendBtn> createState() => _SendBtnState();
}

class _SendBtnState extends State<SendBtn> {
  final _dio = Dio();
  bool _isPending = false;

  @override
  Widget build(BuildContext context) {
    final VoidCallback? onPressed = widget.enabled && !_isPending
        ? () {
            _submitForm();
          }
        : null;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: FilledButton(
        style: FilledButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 177, 93, 157)),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            _isPending ? PENDING : SEND,
            style: const TextStyle(fontSize: 19),
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _submitForm() async {
    setState(() {
      _isPending = true;
    });
    Map<String, String> textData = Map.fromEntries(
        widget.controllers.entries.map((e) => MapEntry(e.key, e.value.text)));
    try {
      final response = await _dio.post(
        API_URL,
        data: jsonEncode(textData),
        options: Options(
          headers: {
            'Content-Type': CONTENT_TYPE,
          },
        ),
      );
      if (response.statusCode == 201) {
        _showSnackBar(SUCCESS);
      } else {
        _showSnackBar(ERROR);
      }
    } catch (error) {
      _showSnackBar(ERROR);
    }
    setState(() {
      _isPending = false;
    });
    clearControllers();
  }

  void clearControllers() {
    widget.controllers.forEach((key, controller) {
      controller.clear();
    });
  }
}
