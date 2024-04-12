import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uc_flutter_task/core/utils/colors.dart';

class InputFields extends StatelessWidget {
  const InputFields({
    super.key,
    required this.hint,
    required this.controller,
    this.label,
    this.onLabelSuffixTap,
    this.suffixIcon,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.read = false,
    this.isPassword = false,
    this.validator,
    this.onChanged,
    this.textInputAction,
    this.inputFormatters,
    this.onTap,
    this.focusedBorder,
    this.maxLength,
    this.fillColor,
    this.enabled = true,
    this.filled = false,
    this.maxForceLength,
    this.prefixIcon,
    this.autofocus = false,
    this.focusNode,
    this.maxLines = 1,
  });

  final String? label;
  final String hint;
  final void Function()? onLabelSuffixTap;
  final Widget? suffixIcon;
  final bool read;
  final TextInputType? keyboardType;
  final bool? isPassword;
  final TextEditingController? controller;
  final TextCapitalization textCapitalization;
  final AutovalidateMode? autovalidateMode;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onTap;
  final InputBorder? focusedBorder;
  final int? maxLength;
  final bool? enabled;
  final Widget? prefixIcon;
  final Color? fillColor;
  final int maxLines;
  final MaxLengthEnforcement? maxForceLength;
  final bool? filled;
  final bool autofocus;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label == '')
          const SizedBox.shrink()
        else if (label != '' || label != null)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 10),
              Text(
                label!,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackColor.withOpacity(0.8),
                ),
              ),
            ],
          )
        else
          const SizedBox.shrink(),
        if (label == '') const SizedBox.shrink() else const SizedBox(height: 5),
        TextFormField(
          key: key,
          onTap: onTap,
          maxLines: maxLines,
          autofocus: autofocus,
          autovalidateMode: autovalidateMode,
          maxLengthEnforcement: maxForceLength,
          maxLength: maxLength,
          focusNode: focusNode,
          onTapOutside: (_) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          inputFormatters: inputFormatters,
          textInputAction: textInputAction,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: AppColors.blackColor,
          ),
          readOnly: read,
          enabled: enabled,
          controller: controller,
          validator: validator,
          keyboardType: keyboardType ?? TextInputType.text,
          textCapitalization: textCapitalization,
          onChanged: onChanged,
          obscureText: isPassword! == true ? true : false,
          cursorColor: AppColors.blackColor,
          cursorHeight: 15,
          decoration: InputDecoration(
            fillColor: fillColor ?? AppColors.greyColor.withOpacity(0.1),
            errorStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.redColor,
            ),
            filled: filled,
            errorMaxLines: 3,
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.greyColor.withOpacity(0.3)),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            enabledBorder: focusedBorder ??
                const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.primaryColor,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
            disabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.greyColor.withOpacity(0.3)),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            focusedBorder: focusedBorder ??
                const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.primaryColor,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor.withOpacity(0.5),
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
