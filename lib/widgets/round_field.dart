import 'package:flutter/material.dart';
import 'package:weather/constants/design.dart';
class roundfield extends StatelessWidget {
  const roundfield({super.key, required this.controller,required this.onSubmitted});
final TextEditingController controller;
  final Function(String) onSubmitted;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.lightTransparentBlack,
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 20,top: 10),
          border: InputBorder.none,
          fillColor: Colors.white,
          focusColor: Colors.white,
          hintText: 'Search',
          hintStyle: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),

        ) ,
        onSubmitted: onSubmitted,
      ),
    );
  }
}
