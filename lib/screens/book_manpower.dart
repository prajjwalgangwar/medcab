import 'package:flutter/material.dart';
import 'package:medcab_assignment/elements/contact_card.dart';
import 'package:medcab_assignment/widgets/book_manpower.dart';
import 'package:medcab_assignment/widgets/frequently_asked_questions.dart';
import 'package:medcab_assignment/widgets/leave_with_smile.dart';
import 'package:medcab_assignment/widgets/m_appbar.dart';
import 'package:medcab_assignment/widgets/m_corousal_slider.dart';
import 'package:medcab_assignment/widgets/m_corousal_slider_healthcard.dart';
import 'package:medcab_assignment/widgets/manpower_booking_function.dart';
import 'package:medcab_assignment/widgets/medcab_healthcard_benefits.dart';
import 'package:medcab_assignment/widgets/popular_categories.dart';
import 'package:medcab_assignment/widgets/search_bar.dart';
import 'package:medcab_assignment/widgets/top_rated_manpower.dart';

class BookManpower extends StatefulWidget {
  const BookManpower({super.key});

  @override
  State<BookManpower> createState() => _BookManpowerState();
}

class _BookManpowerState extends State<BookManpower> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: CustomScrollView(
            slivers: [
              const MAppBar(),
              MSearchBar(
                controller: controller,
              ),
              const CarouselSliderWithIndicator(),
              const CommunicationWidget(),
              const BookManpowerByCategory(),
              const HealthcardBenefit(),
              const PopularCategories(),
              const TopRatedManpower(),
              const CarouselSliderHealthCard(),
              const ManpowerBookingFunction(),
              const FrequentlyAskedQuestions(),
              const LeaveWithSmile(),
              const SliverToBoxAdapter(
                child: SizedBox(height: 22),
              )
            ],
          ),
        ),
      ),
    );
  }
}
