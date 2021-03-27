import 'package:flutter/material.dart';
import 'package:todo_app/resources/app_color.dart';
import 'package:todo_app/resources/app_style.dart';

class AppTextField extends StatefulWidget {
  final String? label;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final String? requiredText;

  AppTextField(
      {this.label,
      this.controller,
      this.focusNode,
      this.textInputAction,
      this.onFieldSubmitted,
      this.requiredText});

  @override
  State<StatefulWidget> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();

    focusNode = widget.focusNode ?? FocusNode();

    focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            if (focusNode.hasFocus)
              BoxShadow(
                  color: AppColor.h000000.withOpacity(0.1),
                  blurRadius: 6,
                  offset: Offset(4, 4))
          ],
          color: AppColor.white,
          borderRadius: focusNode.hasFocus ? BorderRadius.circular(10) : null),
      child: TextFormField(
        controller: widget.controller,
        focusNode: focusNode,
        onFieldSubmitted: widget.onFieldSubmitted,
        textInputAction: widget.textInputAction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            if (widget.requiredText != null) return widget.requiredText;
          }

          return null;
        },
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: AppStyle.hint,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          border: focusNode.hasFocus
              ? InputBorder.none
              : UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.hcfcfcf)),
          errorBorder: focusNode.hasFocus
              ? InputBorder.none
              : UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.hcfcfcf)),
          focusedBorder: focusNode.hasFocus
              ? InputBorder.none
              : UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.hcfcfcf)),
          focusedErrorBorder: focusNode.hasFocus
              ? InputBorder.none
              : UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.hcfcfcf)),
          disabledBorder: focusNode.hasFocus
              ? InputBorder.none
              : UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.hcfcfcf)),
          enabledBorder: focusNode.hasFocus
              ? InputBorder.none
              : UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.hcfcfcf)),
        ),
      ),
    );
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }
}
