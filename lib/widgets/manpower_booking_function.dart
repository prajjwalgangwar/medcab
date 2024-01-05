import 'package:flutter/material.dart';
import 'package:medcab_assignment/elements/divider.dart';
import 'package:medcab_assignment/elements/header.dart';

class ManpowerBookingFunction extends StatelessWidget {
  const ManpowerBookingFunction({super.key});

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
              heading: 'How does the process of Manpower booking function?'),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverToBoxAdapter(
            child: CustomStepperWidget(
              lineType: LineType.dottedLine,
            ),
          ),
        )
      ],
    );
  }
}

// class VerticalStepperWidget extends StatelessWidget {
//   const VerticalStepperWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Stepper(
//       type: StepperType.vertical,
//       currentStep: 0,
//       onStepContinue: () {},
//       onStepCancel: () {},
//       steps: const [
//         Step(
//           title: Text('Step 1'),
//           content: Text('This is the content for Step 1.'),
//         ),
//         Step(
//           title: Text('Step 2'),
//           content: Text('This is the content for Step 2.'),
//         ),
//         Step(
//           title: Text('Step 3'),
//           content: Text('This is the content for Step 3.'),
//         ),
//         Step(
//           title: Text('Step 4'),
//           content: Text('This is the content for Step 4.'),
//         ),
//         Step(
//           title: Text('Step 5'),
//           content: Text('This is the content for Step 5.'),
//         ),
//         Step(
//           title: Text('Step 6'),
//           content: Text('This is the content for Step 6.'),
//         ),
//       ],
//     );
//   }
// }
enum LineType {
  solidLine,
  dottedLine,
}

class CustomStepperWidget extends StatefulWidget {
  final LineType lineType;

  const CustomStepperWidget({Key? key, required this.lineType})
      : super(key: key);

  @override
  CustomStepperWidgetState createState() => CustomStepperWidgetState();
}

class CustomStepperWidgetState extends State<CustomStepperWidget> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 11, top: 2),
          child: Column(
            children: [
              ...List.generate(
                42,
                (index) => Container(
                  margin: const EdgeInsets.only(top: 2),
                  height: 3,
                  width: 1,
                  color: Colors.red.shade300,
                ),
              )
            ],
          ),
        ),
        Column(
          children: [
            CustomStepper(
              lineType: widget.lineType,
              currentStep: currentStep,
              steps: [
                CustomStep(
                    title: 'Choose the test you need to add it to cart',
                    content: 'This is the content for Step 1.'),
                CustomStep(
                    title:
                        'Add the Patient/Choose the Patient(if already added)',
                    content: 'This is the content for Step 2.'),
                CustomStep(
                    title:
                        'Provide the personal information including name and address',
                    content: 'This is the content for Step 3.'),
                CustomStep(
                    title: 'Book a slot for Sample Collection',
                    content: 'This is the content for Step 4.'),
                CustomStep(
                    title:
                        'Pay for the test including the Online Secure Payment Methods.',
                    content: 'This is the content for Step 5.'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class CustomStep {
  final String title;
  final String content;

  CustomStep({required this.title, required this.content});
}

class CustomStepper extends StatelessWidget {
  final LineType lineType;
  final int currentStep;
  final List<CustomStep> steps;

  const CustomStepper({
    super.key,
    required this.lineType,
    required this.currentStep,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(steps.length, (index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildStepIcon(),
                const SizedBox(width: 12.0),
                Flexible(
                  child: Text(
                    steps[index].title,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            _buildLine()
          ],
        );
      }),
    );
  }

  Widget _buildLine() {
    return SizedBox(
      height: 24.0,
      child: CustomPaint(
        painter: LinePainter(lineType),
      ),
    );
  }

  Widget _buildStepIcon() {
    return Container(
      width: 24.0,
      height: 24.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red.shade300,
      ),
      child: const Center(
        child: Icon(
          Icons.check,
          size: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  final LineType lineType;

  LinePainter(this.lineType);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.0;

    final Offset startPoint = Offset(12.0, size.height / 2);
    final Offset endPoint = Offset(size.width - 12.0, size.height / 2);

    if (lineType == LineType.dottedLine) {
      _drawDottedLine(canvas, paint, startPoint, endPoint);
    } else {
      canvas.drawLine(startPoint, endPoint, paint);
    }
  }

  void _drawDottedLine(
      Canvas canvas, Paint paint, Offset startPoint, Offset endPoint) {
    const double dashLength = 8.0;
    final double distance = endPoint.dx - startPoint.dx;
    final int dashCount = (distance / (2 * dashLength)).floor();

    for (int i = 0; i < dashCount; i++) {
      final double startX = startPoint.dx + 2 * i * dashLength;
      final double endX = startX + dashLength;
      canvas.drawLine(
          Offset(startX, startPoint.dy), Offset(endX, endPoint.dy), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
