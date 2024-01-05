import 'package:flutter/material.dart';
import 'package:medcab_assignment/elements/divider.dart';
import 'package:medcab_assignment/elements/header.dart';

class BookManpowerByCategory extends StatelessWidget {
  const BookManpowerByCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: MDivider(
            color: Colors.grey.shade300,
          ),
        ),
        SliverToBoxAdapter(
          child: Header(
            heading: 'Book Manpower by Category',
            trailing: Text(
              'View All',
              style: TextStyle(
                  color: Colors.red.shade300, fontWeight: FontWeight.w500),
            ),
            trailingFlex: 4,
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
                return const BookManpowerByCategoryCard();
              },
              childCount: 6,
            ),
          ),
        ),
      ],
    );
  }
}

class BookManpowerByCategoryCard extends StatelessWidget {
  const BookManpowerByCategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8)),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          flex: 8,
          child: Container(
            margin: const EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
                color: Colors.orangeAccent.shade200.withOpacity(0.4),
                shape: BoxShape.rectangle),
          ),
        ),
        const Flexible(
            flex: 1,
            child: Text(
              'Peadiatric Nurse',
              style: TextStyle(fontSize: 12),
            ))
      ]),
    );
  }
}
