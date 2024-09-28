import 'dart:math' as math show sin, pi;

import 'package:app/themes/colors.dart';
import 'package:flutter/widgets.dart';

class FadingCircle extends StatefulWidget {
  final Color color;
  final double size;
  const FadingCircle({this.color = primary, this.size = 50.0});

  @override
  State<FadingCircle> createState() => _FadingCircleState();
}

class _FadingCircleState extends State<FadingCircle> with SingleTickerProviderStateMixin {
  int itemCount = 12;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = (AnimationController(vsync: this, duration: const Duration(milliseconds: 1800)))..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size.square(widget.size),
        child: Stack(
          children: List.generate(itemCount, (i) {
            final position = widget.size * .5;
            return Positioned.fill(
              left: position,
              top: position,
              child: Transform(
                transform: Matrix4.rotationZ(30.0 * i * 0.0174533),
                child: Align(
                  child: FadeTransition(
                    opacity: _DelayTween(begin: 0, end: 1, delay: i / itemCount).animate(_controller),
                    child: SizedBox.fromSize(size: Size.square(widget.size * 0.15), child: _itemBuilder(i)),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _itemBuilder(int index) => DecoratedBox(decoration: BoxDecoration(color: widget.color, shape: BoxShape.circle));
}

class _DelayTween extends Tween<double> {
  _DelayTween({required this.delay, double? begin, double? end}) : super(begin: begin, end: end);
  final double delay;

  @override
  double lerp(double t) => super.lerp((math.sin((t - delay) * 2 * math.pi) + 1) / 2);

  @override
  double evaluate(Animation<double> animation) => lerp(animation.value);
}
