import 'package:flutter/material.dart';
import 'package:weather/extensions/conversions.dart';
import '../models/weather.dart';
import '/constants/design.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: screenSize.height,
        width: screenSize.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.black,
              AppColors.black.withOpacity(0.9),
              AppColors.matteBlack.withOpacity(0.8),
              AppColors.matteBlack.withOpacity(0.7),
              AppColors.black.withOpacity(0.9),
              AppColors.black,
            ],
            stops: [0.0, 0.2, 0.5, 0.7, 0.9, 1.0],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.7),
              blurRadius: 20.0,
              spreadRadius: 1.0,
              offset: Offset(5.0, 5.0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 24.0,
            right: 24.0,
            top: 36.0,
          ),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  children,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

