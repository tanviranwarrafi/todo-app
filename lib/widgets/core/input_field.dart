import 'package:app/themes/colors.dart';
import 'package:app/themes/text_styles.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final double padding;
  final int minLines;
  final int maxLines;
  final bool obscureText;
  final Color fillColor;
  final bool readOnly;
  final bool showCursor;
  final bool autoFocus;
  final double borderRadius;
  final EdgeInsetsGeometry contentPadding;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final String hintText;
  final Color borderColor;
  final int? maxLength;
  final FocusNode? focusNode;
  final String? counterText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? initialValue;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final Function(PointerDownEvent)? onTapOutside;
  final Function()? onTap;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;

  const InputField({
    this.padding = 0,
    this.borderRadius = 8,
    this.minLines = 1,
    this.maxLines = 1,
    this.obscureText = false,
    this.fillColor = white,
    this.readOnly = false,
    this.autoFocus = false,
    this.showCursor = true,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.textCapitalization = TextCapitalization.none,
    this.hintText = '',
    this.borderColor = primary,
    this.maxLength,
    this.focusNode,
    this.counterText,
    this.prefixIcon,
    this.suffixIcon,
    this.initialValue,
    this.controller,
    this.onChanged,
    this.onEditingComplete,
    this.onTapOutside,
    this.onTap,
    this.onFieldSubmitted,
    this.validator,
  });

  @override
  Widget build(BuildContext context) => Padding(padding: EdgeInsets.symmetric(horizontal: padding), child: _textFormField(context));

  Widget _textFormField(BuildContext context) {
    // var isMobile = SizeConfig.isMobile;
    return TextFormField(
      validator: validator,
      maxLength: maxLength,
      controller: controller,
      initialValue: initialValue,
      readOnly: readOnly,
      autofocus: autoFocus,
      decoration: _inputDecoration,
      showCursor: showCursor,
      focusNode: focusNode,
      cursorWidth: 1.2,
      cursorHeight: 16,
      minLines: minLines,
      maxLines: maxLines,
      obscureText: obscureText,
      cursorColor: dark,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      onSaved: controller != null ? (val) => controller?.text = val! : null,
      style: TextStyles.text14_500.copyWith(color: _is_disabled ? grey1 : dark),
      onEditingComplete: () => _onEditingComplete(context),
      onTapOutside: (event) => _onTapOutside(context, event),
    );
  }

  void _onEditingComplete(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (onEditingComplete != null) onEditingComplete!();
  }

  void _onTapOutside(BuildContext context, PointerDownEvent event) {
    FocusScope.of(context).unfocus();
    if (onTapOutside != null) onTapOutside!(event);
  }

  bool get _is_disabled => readOnly == true;

  InputDecoration get _inputDecoration {
    // var isMobile = SizeConfig.isMobile;
    return InputDecoration(
      filled: true,
      isDense: true,
      enabled: !_is_disabled,
      errorMaxLines: 1,
      hintText: hintText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      counterText: counterText,
      fillColor: _is_disabled || focusNode == null || !focusNode!.hasFocus ? offWhite2 : fillColor,
      // focusColor: primary,
      prefixIconConstraints: const BoxConstraints(minWidth: 46, minHeight: 48),
      suffixIconConstraints: const BoxConstraints(minWidth: 44, minHeight: 48),
      contentPadding: contentPadding,
      prefixIconColor: _is_disabled ? grey1 : WidgetStateColor.resolveWith((states) => states.contains(WidgetState.focused) ? dark : grey2),
      suffixIconColor: _is_disabled ? grey1 : WidgetStateColor.resolveWith((states) => states.contains(WidgetState.focused) ? dark : grey2),
      border: _outlinedOrEnabled,
      enabledBorder: _outlinedOrEnabled,
      disabledBorder: _outlinedDisabled,
      focusedBorder: _outlinedFocused,
      errorBorder: _outlinedError,
      focusedErrorBorder: _outlinedError,
      labelStyle: TextStyles.text14_500.copyWith(color: _is_disabled ? grey1 : dark),
      hintStyle: TextStyles.text14_500.copyWith(color: _is_disabled ? grey1 : grey2),
      errorStyle: TextStyles.text14_500.copyWith(color: error),
    );
  }

  get _radius => BorderRadius.circular(borderRadius);
  get _outlinedOrEnabled => OutlineInputBorder(borderRadius: _radius, borderSide: const BorderSide(color: offWhite2));
  get _outlinedFocused => OutlineInputBorder(borderRadius: _radius, borderSide: BorderSide(color: borderColor));
  get _outlinedDisabled => OutlineInputBorder(borderRadius: _radius, borderSide: const BorderSide(color: offWhite2));
  get _outlinedError => OutlineInputBorder(borderRadius: _radius, borderSide: const BorderSide(color: error));
}
