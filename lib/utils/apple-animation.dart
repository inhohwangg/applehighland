import 'package:flutter/material.dart';

class AnimatedBorderContainer extends StatefulWidget {
  final Widget child;
  final bool shouldAnimate;

  const AnimatedBorderContainer({
    required this.child,
    required this.shouldAnimate,
    super.key,
  });

  @override
  State<AnimatedBorderContainer> createState() =>
      _AnimatedBorderContainerState();
}

class _AnimatedBorderContainerState extends State<AnimatedBorderContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat(reverse: false);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: widget.shouldAnimate
                ? Border.all(
                    color: HSLColor.fromAHSL(
                      1.0,
                      (_controller.value * 360),
                      0.8,
                      0.7,
                    ).toColor(),
                    width: 2,
                  )
                : null,
          ),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
