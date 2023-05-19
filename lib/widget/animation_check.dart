import '../utils/file_collection.dart';

class AnimatedCheck extends StatefulWidget {
  const AnimatedCheck({super.key});

  @override
  State<AnimatedCheck> createState() => _AnimatedCheckState();
}

class _AnimatedCheckState extends State<AnimatedCheck>
    with TickerProviderStateMixin {
  late AnimationController scaleController = AnimationController(
      duration: const Duration(milliseconds: 50), vsync: this);
  late Animation<double> scaleAnimation =
      CurvedAnimation(parent: scaleController, curve: Curves.elasticOut);
  late AnimationController checkController = AnimationController(
      duration: const Duration(milliseconds: 800), vsync: this);
  late Animation<double> checkAnimation =
      CurvedAnimation(parent: checkController, curve: Curves.linear);

  @override
  void initState() {
    super.initState();
    scaleController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        checkController.forward();
      }
    });
    scaleController.forward();
  }

  @override
  void dispose() {
    scaleController.dispose();
    checkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double circleSize = 140;
    double iconSize = 108;

    return Stack(
      children: [
        Center(
          child: ScaleTransition(
            scale: scaleAnimation,
            child: Container(
              height: circleSize,
              width: circleSize,
              decoration: const BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        SizeTransition(
          sizeFactor: checkAnimation,
          axis: Axis.horizontal,
          axisAlignment: -1,
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 13.0),
              child: Icon(Icons.check, color: Colors.white, size: iconSize),
            ),
          ),
        ),
      ],
    );
  }
}
