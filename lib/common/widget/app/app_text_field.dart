import 'package:flutter/material.dart';
import 'package:portfolio/common/dart/extension/context_extension.dart';
import 'package:portfolio/common/dart/extension/text_styles_extention.dart';
import 'package:portfolio/common/dart/extension/widget.dart';
import 'package:portfolio/common/theme/color/app_colors.dart';

class AppTextField extends StatefulWidget {
  final String hint;
  final String? initialValue, title;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function(String?)? onChange;
  final TextInputType inputType;
  final bool isPassword, readOnly;
  final int? maxLines, minLines, length;
  final Function()? onTap, ignorePointerTap;
  final bool obscureText;
  final Widget? prefixWidget;
  final EdgeInsetsGeometry margin;

  const AppTextField({
    super.key,
    required thisint,
    this.initialValue,
    required this.controller,
    this.validator,
    this.margin = EdgeInsets.zero,
    this.prefixWidget,
    this.readOnly = false,
    this.onChange,
    this.ignorePointerTap,
    this.title,
    this.maxLines,
    this.minLines,
    this.isPassword = false,
    this.obscureText = false,
    this.length,
    this.inputType = TextInputType.text,
    this.onTap,
    required this.hint,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final errorBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Text(widget.title!,
                  style:
                      context.textStyle?.regular.s14.setColor(AppColors.text))
              .marginBottom(6),
        Padding(
          padding: widget.margin,
          child: TextFormField(
            onTap: () {
              if (widget.onTap != null) {
                widget.onTap!();
              }
            },
            autovalidateMode: AutovalidateMode.disabled,
            initialValue: widget.initialValue,
            controller: widget.controller,
            obscureText: widget.isPassword ? !_isPasswordVisible : false,
            validator: widget.validator,
            keyboardType: widget.inputType,
            maxLines:
                widget.isPassword && !_isPasswordVisible ? 1 : widget.maxLines,
            minLines:
                widget.isPassword && !_isPasswordVisible ? 1 : widget.minLines,
            readOnly: widget.readOnly,
            maxLength: widget.length,
            style: context.textStyle?.regular.s13,
            onChanged: (text) {
              if (widget.onChange != null) {
                widget.onChange!(text);
              }
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.focusedBorder),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              labelText: null,
              hintText: widget.hint,
              labelStyle:
                  context.textStyle?.regular.s12.setColor(Colors.black45),
              hintStyle: context.textStyle?.regular.s11.setColor(
                AppColors.hintText,
              ),
              alignLabelWithHint: false,
              prefixIcon: widget.prefixWidget,
              errorMaxLines: 2,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.shadowColor),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              errorBorder: errorBorder,
              focusedErrorBorder: errorBorder,
              suffixIcon: widget.isPassword
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      child: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppColors.hintText,
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
