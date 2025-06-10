import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final String text;
  final bool isPrimary;
  final int delay;
  final Color? textColor;

  const AnimatedButton({
    super.key,
    required this.text,
    required this.isPrimary,
    required this.delay,
    this.textColor,
  });

  @override
  AnimatedButtonState createState() => AnimatedButtonState();
}

class AnimatedButtonState extends State<AnimatedButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    ));

    Future.delayed(Duration(milliseconds: 800 + widget.delay), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ScaleTransition(
      scale: _scaleAnimation,
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.isPrimary ? AppColors.kPrimaryColor : Colors.transparent,
            foregroundColor:
                widget.isPrimary ? AppColors.kPrimaryWhiteColor : AppColors.kPrimaryColor,
            elevation: widget.isPrimary ? 8 : 0,
            shadowColor: widget.isPrimary
                ? AppColors.kPrimaryColor.withValues(alpha: 0.3)
                : Colors.transparent,
            side: widget.isPrimary ? null : BorderSide(color: AppColors.kPrimaryColor, width: 1.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            widget.text,
            style: textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
              color: widget.textColor ?? AppColors.kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
