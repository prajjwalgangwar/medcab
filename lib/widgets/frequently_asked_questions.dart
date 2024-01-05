import 'package:flutter/material.dart';
import 'package:medcab_assignment/elements/divider.dart';
import 'package:medcab_assignment/elements/header.dart';
import 'package:medcab_assignment/utils/constants.dart';

class FrequentlyAskedQuestions extends StatelessWidget {
  const FrequentlyAskedQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: MDivider(
            marginTop: 8,
            color: Colors.grey.shade300,
          ),
        ),
        const SliverToBoxAdapter(
          child: Header(
            heading: 'Frequently Asked Questions',
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return FAQCard(
                  question: AppConstants.faqMap.keys.elementAt(index),
                  answer: AppConstants.faqMap.values.elementAt(index),
                );
              },
              childCount: 8, // Number of list items
            ),
          ),
        ),
      ],
    );
  }
}

class FAQCard extends StatefulWidget {
  final String question;
  final String answer;
  const FAQCard({super.key, required this.question, required this.answer});

  @override
  State<FAQCard> createState() => _FAQCardState();
}

class _FAQCardState extends State<FAQCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 14,
              child: Text(
                widget.question,
                maxLines: 2,
              ),
            ),
            Flexible(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Icon(
                      isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    ),
                  ),
                )),
          ],
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: isExpanded ? 60.0 : 0.0,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.answer,
                  style: TextStyle(color: Colors.grey.shade400),
                )
              ],
            ),
          ),
        ),
        Divider(
          color: Colors.grey.shade300,
        )
      ],
    );
  }
}
