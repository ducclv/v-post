import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingDots extends StatefulWidget {
  final int numberDots;

  const LoadingDots({required this.numberDots, Key? key}) : super(key: key);

  @override
  _JumpingDots createState() => _JumpingDots();
}

class _JumpingDots extends State<LoadingDots> with TickerProviderStateMixin {
  final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  late List<AnimationController> animationController;
  List<Animation<double>> animation = [];
  int animationDuration = 300;

  @override
  void initState() {
    super.initState();
    initAnimation();
  }

  @override
  void dispose() {
    for (var controller in animationController) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(widget.numberDots, (index) {
          return AnimatedBuilder(
            animation: animationController[index],
            builder: (context, child) {
              return Expanded(
                  child: Opacity(
                      opacity: _opacityTween.evaluate(animationController[index]),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 2),
                        child: Container(
                          decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xFF67ABDB)),
                          height: 10,
                          width: 10,
                        ),
                      )));
            },
          );
        }).toList(),
      ),
    );
  }

  void initAnimation() {
    animationController = List.generate(
      widget.numberDots,
      (index) {
        return AnimationController(vsync: this, duration: Duration(milliseconds: animationDuration));
      },
    ).toList();
    for (int i = 0; i < widget.numberDots; i++) {
      animation.add(animationController[i].drive(CurveTween(curve: Curves.easeOut)));
    }
    for (int i = 0; i < widget.numberDots; i++) {
      animationController[i].addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController[i].reverse();
          if (i != widget.numberDots - 1) {
            animationController[i + 1].forward();
          }
        }
        if (i == widget.numberDots - 1 && status == AnimationStatus.dismissed) {
          animationController[0].forward();
        }
      });
    }
    animationController.first.forward();
  }
}
