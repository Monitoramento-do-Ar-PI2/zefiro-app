import 'package:flutter/material.dart';

class AnimatedCircle extends StatefulWidget {
  @override
  _AnimatedCircleState createState() => _AnimatedCircleState();
}

class _AnimatedCircleState extends State<AnimatedCircle>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..addListener(() => setState(() {}));
    animation = Tween<double>(
      begin: 50.0,
      end: 120.0,
    ).animate(animationController);

    animationController.forward();

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.repeat(reverse: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      alignment: Alignment.center,
      height: animation.value,
      width: animation.value,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromARGB(255, 82, 199, 217).withOpacity(0.2),
          border:
              Border.all(width: 2.0, color: Color.fromARGB(255, 82, 199, 217))),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
