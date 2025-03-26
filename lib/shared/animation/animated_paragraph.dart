import 'package:edtech_app/features/blogs_details/controller/pod/text_magnifier_pod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimatedParagraph extends ConsumerStatefulWidget {
  final String text;
  final TextStyle? textStyle;
  final Duration letterFadeDuration;
  final Duration letterDelay;

  const AnimatedParagraph({
    super.key,
    required this.text,
    this.textStyle,
    this.letterFadeDuration = const Duration(milliseconds: 200),
    this.letterDelay = const Duration(milliseconds: 50),
  });

  @override
  AnimatedParagraphState createState() => AnimatedParagraphState();
}

class AnimatedParagraphState extends ConsumerState<AnimatedParagraph>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();

    // Create a controller and animation for each letter
    _controllers = List.generate(
      widget.text.length,
      (index) => AnimationController(
        vsync: this,
        duration: widget.letterFadeDuration,
      ),
    );

    _animations = _controllers
        .map((controller) => Tween<double>(begin: 0.0, end: 1.0).animate(controller))
        .toList();

    // Start animations with sequential delays
    _startAnimations();
  }

  void _startAnimations() async {
    for (int i = 0; i < _controllers.length; i++) {
      await Future.delayed(widget.letterDelay);
      if (mounted) {
        _controllers[i].forward();
      }
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textMagnifier = ref.watch(textMagnifyProvider);

    return Wrap(
      alignment: WrapAlignment.start,
      children: List.generate(
        widget.text.length,
        (index) => FadeTransition(
          opacity: _animations[index],
          child: Text(
            widget.text[index],
            textScaler: TextScaler.linear(textMagnifier),
            style: widget.textStyle,
          ),
        ),
      ),
    );
  }
}
