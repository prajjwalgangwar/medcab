import 'package:flutter/material.dart';
import 'package:medcab_assignment/elements/header.dart';
import 'package:medcab_assignment/utils/constants.dart';

class HealthcardBenefit extends StatelessWidget {
  const HealthcardBenefit({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(slivers: [
      const SliverToBoxAdapter(
        child: Header(
            verticalMargin: 28, heading: 'Check Medcab HealthCard Benefits'),
      ),
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        sliver: SliverToBoxAdapter(
          child: AspectRatio(
            aspectRatio: 16 / 7,
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent)),
                child: Image.network(AppConstants.image1)),
          ),
        ),
      )
    ]);
  }
}
