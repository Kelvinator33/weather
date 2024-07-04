import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/constants/design.dart';
import 'package:weather/widgets/famouscities.dart';
import 'package:weather/widgets/round_field.dart';
import 'package:weather/widgets/citytiles.dart';

import '../view/gradient.dart';

class searchscreen extends StatefulWidget {
  const searchscreen({super.key});

  @override
  State<searchscreen> createState() => _searchscreenState();
}

class _searchscreenState extends State<searchscreen> {
  late final TextEditingController ctrl;
  String query = '';

  @override
  void initState() {
    super.initState();
    ctrl = TextEditingController();
  }

  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }

  void performSearch() {
    setState(() {
      query = ctrl.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Search', style: TextStyles.h1),
              SizedBox(height: 30),
              Text(
                'Search for the weather info of the city or area you want',
                style: TextStyles.subtitleText,
              ),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              Expanded(
                child: roundfield(
                  controller: ctrl,
                  onSubmitted: (_) => performSearch(),
                ),
              ),
              const SizedBox(width: 15),
              GestureDetector(
                onTap: performSearch,
                child: const loc_icon(),
              ),
            ],
          ),
          const SizedBox(height: 30),
          if (query.isNotEmpty) citytile(city: query, index: 0),
          if (query.isEmpty) const famouscities(),
        ],
      ),
    );
  }
}

class loc_icon extends StatelessWidget {
  const loc_icon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        color: AppColors.lightTransparentBlack,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(
        Icons.search,
        color: AppColors.grey,
      ),
    );
  }
}
