
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'otp_input_code.dart';

class OtpInputRow extends StatefulWidget {
  const OtpInputRow({
    super.key,
    this.length = 4,
    required this.onCompleted,
  });

  final int length;
  final ValueChanged<String> onCompleted;

  @override
  State<OtpInputRow> createState() => _OtpInputRowState();
}

class _OtpInputRowState extends State<OtpInputRow> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  bool _submitted = false;

  @override
  void initState() {
    super.initState();

    _controllers = List.generate(
      widget.length,
          (_) => TextEditingController(),
    );

    _focusNodes = List.generate(
      widget.length,
          (_) => FocusNode(),
    );
  }

  void _onChanged(int index, String value) {
    _submitted = false;

    if (value.isNotEmpty) {
      if (index < widget.length - 1) {
        _focusNodes[index + 1].requestFocus();
      }
    } else {
      if (index > 0) {
        _focusNodes[index - 1].requestFocus();
      }
    }

    final code = _controllers
        .map((controller) => controller.text)
        .join();

    final isComplete = _controllers.every(
          (controller) => controller.text.isNotEmpty,
    );

    if (isComplete && !_submitted) {
      _submitted = true;
      widget.onCompleted(code);
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }

    for (final focusNode in _focusNodes) {
      focusNode.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(widget.length * 2 - 1, (index) {
        if (index.isOdd) {
          return SizedBox(width: 16.w);
        }

        final boxIndex = index ~/ 2;

        return Expanded(
          child: OtpInputBox(
            controller: _controllers[boxIndex],
            focusNode: _focusNodes[boxIndex],
            onChanged: (value) => _onChanged(boxIndex, value),
          ),
        );
      }),
    );
  }
}
