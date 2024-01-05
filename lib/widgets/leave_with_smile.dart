import 'package:flutter/material.dart';
import 'package:medcab_assignment/elements/divider.dart';
import 'package:medcab_assignment/elements/header.dart';

class LeaveWithSmile extends StatelessWidget {
  const LeaveWithSmile({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(slivers: [
      SliverToBoxAdapter(
        child: MDivider(
          color: Colors.grey.shade300,
        ),
      ),
      SliverToBoxAdapter(
        child: Header(
          heading: 'We ensure our customers leave with a smile on their faces!',
          trailing: SizedBox(
              width: 20,
              height: 20,
              child: Image.asset('assets/happiness.png')),
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        sliver: SliverToBoxAdapter(
          child: Column(
            children: [
              Container(
                height: 125,
                width: 125,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.purple.shade100),
                child: const Icon(
                  Icons.person,
                  size: 60,
                ),
              ),
              const Text(
                'Saurav Rajpoot',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              const Text('Lucknow'),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.\"",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      )
    ]);
  }
}
