import 'package:flutter/material.dart';
import 'package:medcab_assignment/elements/divider.dart';
import 'package:medcab_assignment/elements/header.dart';

class TopRatedManpower extends StatelessWidget {
  const TopRatedManpower({super.key});

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
            heading: 'Top Rated Manpower',
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 9 / 12),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return const TopRatedManpowerCard();
              },
              childCount: 4,
            ),
          ),
        ),
      ],
    );
  }
}

class TopRatedManpowerCard extends StatelessWidget {
  const TopRatedManpowerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade400.withOpacity(0.4),
                      shape: BoxShape.rectangle),
                ),
              ),
              Flexible(
                flex: orientation == Orientation.landscape
                    ? 1
                    : MediaQuery.of(context).size.height > 900
                        ? 1
                        : 2,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber.shade300,
                            size: 16,
                          ),
                          const Text(
                            '4.5',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '(1234 reviews)',
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey.shade500),
                          ),
                        ],
                      ),
                      const Text(
                        'Peadiatric Nurse',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. The overflow will',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey.shade500),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  // height: 40,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red.shade200),
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Text(
                      'Add to Cart',
                      style: TextStyle(
                        color: Colors.red.shade200,
                      ),
                    ),
                  ),
                ),
              )
            ]),
      );
    });
  }
}
