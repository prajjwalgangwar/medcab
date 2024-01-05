import 'package:flutter/material.dart';
import 'package:medcab_assignment/elements/divider.dart';

class ContactCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final Color iconColor;
  const ContactCard(
      {super.key,
      required this.name,
      required this.icon,
      this.iconColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(
        icon,
        color: iconColor,
      ),
      const SizedBox(
        width: 6,
      ),
      Text(name)
    ]);
  }
}

class CommunicationWidget extends StatelessWidget {
  const CommunicationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: MDivider(
            marginTop: 16,
            marginBottom: 16,
            color: Colors.grey.shade300,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          sliver: SliverToBoxAdapter(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ContactCard(
                    icon: Icons.phone,
                    name: 'Call Expert',
                  ),
                  Container(
                    height: 22,
                    width: 3,
                    color: Colors.grey.shade500,
                  ),
                  ContactCard(
                    icon: Icons.message,
                    name: 'Whatsapp',
                    iconColor: Colors.red.shade300,
                  ),
                  Container(
                    height: 22,
                    width: 3,
                    color: Colors.grey.shade500,
                  ),
                  ContactCard(
                    icon: Icons.history,
                    name: 'History',
                    iconColor: Colors.orange.shade300,
                  )
                ]),
          ),
        ),
      ],
    );
  }
}
