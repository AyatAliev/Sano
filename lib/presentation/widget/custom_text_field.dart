import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintTex;
  final TextInputType keyboardType;

  const CustomTextField({Key? key, required this.controller, required this.hintTex, required this.keyboardType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xffF2F2F2),
          ),
        ),
      ),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        keyboardType: keyboardType,
        autocorrect: false,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          isDense: true,
          hintText: hintTex,
          hintStyle: CupertinoTheme.of(context)
              .textTheme
              .textStyle
              .copyWith(
            color: const Color(0xffCDCDD0),
            fontSize: 16,
            height: 19.2 / 16,
          ),
        ),
      ),
    );
  }
}