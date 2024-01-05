import 'package:flutter/material.dart';

class MAppBar extends StatelessWidget {
  const MAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      sliver: SliverToBoxAdapter(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 26,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        'Book Manpower',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Search Nurses Near by ',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        TextSpan(
                          text: 'Indira Nagar Lucknow',
                          style: TextStyle(
                            color: Colors.red.shade400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.red.shade400,
                  )
                ],
              )
            ],
          ),
          const Icon(Icons.shopping_cart_rounded)
        ]),
      ),
    );
  }
}
