import 'package:flutter/material.dart';
import 'package:goodfoods/core/colors.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String placeholder;
  String? Function(String?)? validator;
  final Widget? leading;
  final Widget? trailing;
  final bool password;
  final bool? isInputAea;
  final void Function()? trailingTapped;


   PasswordField({
    Key? key,
    required this.controller,
    this.placeholder = '',
    this.leading,
    this.trailing,
    this.trailingTapped,
    this.validator,
    this.password = false, this.isInputAea=false,
  }) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  final circularBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
  );
bool isVisible= false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator ,
      controller: widget.controller,
      style: const TextStyle(height: 1),
       keyboardType:widget.isInputAea!? TextInputType.multiline:null,
                      maxLines: widget.isInputAea!?20:1,
      obscureText: !isVisible,
      decoration: InputDecoration(
        suffixIcon: IconButton(onPressed: (){
          isVisible = !isVisible;
          setState(() {
            
          });
        }, icon: 
        Icon(
          isVisible ?
          Icons.visibility:Icons.visibility_off
        )
        
        ),
        hintText: widget.placeholder,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: widget.leading,
        
        border: circularBorder.copyWith(
          borderSide: const BorderSide(color: kcLightGreyColor),
        ),
        errorBorder: circularBorder.copyWith(
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedBorder: circularBorder.copyWith(
          borderSide: const BorderSide(color: kcPrimaryColor),
        ),
        enabledBorder: circularBorder.copyWith(
          borderSide: const BorderSide(color: kcLightGreyColor),
        ),
      ),
    );
  }
}