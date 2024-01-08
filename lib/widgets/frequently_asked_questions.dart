import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medcab_assignment/blocs/book_manpower_bloc/bloc.dart';
import 'package:medcab_assignment/blocs/book_manpower_bloc/state.dart';
import 'package:medcab_assignment/elements/divider.dart';
import 'package:medcab_assignment/elements/header.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FrequentlyAskedQuestions extends StatefulWidget {
  const FrequentlyAskedQuestions({super.key});

  @override
  State<FrequentlyAskedQuestions> createState() =>
      _FrequentlyAskedQuestionsState();
}

class _FrequentlyAskedQuestionsState extends State<FrequentlyAskedQuestions>
    with SingleTickerProviderStateMixin {
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
        BlocBuilder<BookManpowerBloc, ManpowerState>(builder: (context, state) {
          print(
              'state. ManpowerState: ${state.faqResponse.jsonData.faqList.length}');
          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Skeletonizer(
                    enabled:
                        state.faqResponseStatus == FAQResponseStatus.fetching,
                    child: FAQCard(
                      question: state.faqResponse.jsonData.faqList
                          .elementAt(index)
                          .header,
                      answer: state.faqResponse.jsonData.faqList
                          .elementAt(index)
                          .description,
                    ),
                  );
                },
                childCount: state.faqResponse.jsonData.faqList
                    .length, // Number of list items
              ),
            ),
          );
        }),
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

class _FAQCardState extends State<FAQCard> with SingleTickerProviderStateMixin {
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
  }

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
        if (isExpanded)
          Column(
            children: [
              Text(
                widget.answer,
                style: TextStyle(color: Colors.grey.shade400),
              ),
            ],
          ),
        Divider(
          color: Colors.grey.shade300,
        )
      ],
    );
  }
}
