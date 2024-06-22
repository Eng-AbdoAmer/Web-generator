import 'package:flutter/material.dart';
import '../constant/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  final Function(String?)? onSaved;
  final String? label;
  final String? initialValue;
  final String? hintText;
  final bool obscureText;
  final IconData? icon;
  final TextInputType? keyboardType;
  final void Function()? onPressedIconButton;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final bool readOnly;
  final int? maxLines;
  final Widget? prefixIcon;
  final TextEditingController? controller;

  const CustomTextFormField({
    Key? key,
    this.onSaved,
    this.label,
    this.obscureText = false,
    this.hintText,
    this.icon,
    this.validator,
    this.onPressedIconButton,
    this.keyboardType,
    this.initialValue,
    this.onTap,
    this.readOnly = false,
    this.controller,
    this.maxLines = 1,
    this.onChanged,
    this.prefixIcon,
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      maxLines: widget.maxLines,
      controller: widget.controller,
      readOnly: widget.readOnly,
      onSaved: widget.onSaved,
      onTap: widget.onTap,
      initialValue: widget.initialValue,
      obscureText: _obscureText,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      style: const TextStyle(color: AppColors.black, fontSize: 14),
      decoration: InputDecoration(
        counterStyle: const TextStyle(color: AppColors.black),
        hintStyle: const TextStyle(color: AppColors.lightBlack),
        prefixIcon: widget.prefixIcon,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.primaryColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.black),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        label: Text(widget.label ?? ""),
        hintText: widget.hintText,
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : IconButton(
                onPressed: widget.onPressedIconButton,
                icon: Icon(widget.icon),
              ),
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
