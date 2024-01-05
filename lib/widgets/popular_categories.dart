import 'package:flutter/material.dart';
import 'package:medcab_assignment/elements/divider.dart';
import 'package:medcab_assignment/elements/header.dart';

class PopularCategoryCard extends StatelessWidget {
  const PopularCategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        flex: 8,
        child: Container(
          margin: const EdgeInsets.only(bottom: 4),
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.width * 0.3,
          decoration: BoxDecoration(
              color: Colors.purple.shade100, shape: BoxShape.circle),
        ),
      ),
      const Flexible(flex: 1, child: Text('Peadiatric Nurse'))
    ]);
  }
}

class PopularCategories extends StatelessWidget {
  const PopularCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: MDivider(
            color: Colors.grey.shade300,
          ),
        ),
        const SliverToBoxAdapter(
          child: Header(
            heading: 'Popular Categories',
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 9 / 12),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return const PopularCategoryCard();
              },
              childCount: 6,
            ),
          ),
        ),
      ],
    );
  }
}
