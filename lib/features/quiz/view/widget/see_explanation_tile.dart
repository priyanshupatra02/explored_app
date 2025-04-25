import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:flutter/material.dart';

class SeeExplanationTile extends StatefulWidget {
  final String title;
  final Widget content;
  final TextStyle? titleStyle;
  final Color? iconColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? contentPadding;
  final Duration animationDuration;
  final bool initiallyExpanded;

  const SeeExplanationTile({
    super.key,
    required this.title,
    required this.content,
    this.titleStyle,
    this.iconColor,
    this.padding,
    this.contentPadding,
    this.animationDuration = const Duration(milliseconds: 200),
    this.initiallyExpanded = false,
  });

  @override
  State<SeeExplanationTile> createState() => _SeeExplanationTileState();
}

class _SeeExplanationTileState extends State<SeeExplanationTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _iconTurns;
  late Animation<double> _heightFactor;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.animationDuration, vsync: this);

    _heightFactor = _controller.drive(CurveTween(curve: Curves.easeIn));
    _iconTurns = _controller
        .drive(Tween<double>(begin: 0.0, end: 0.5).chain(CurveTween(curve: Curves.easeIn)));

    _isExpanded = widget.initiallyExpanded;
    if (_isExpanded) {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final defaultTextStyle = theme.textTheme.bodyLarge?.copyWith(
      color: AppColors.kPrimaryColor,
      fontWeight: FontWeight.bold,
    );
    // TextStyle(
    //   color: Color(0xFF1A5089),
    //   fontSize: Themeo,
    //   fontWeight: FontWeight.w500,
    // );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        InkWell(
          onTap: _handleTap,
          child: Padding(
            padding: widget.padding ?? const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  widget.title,
                  style: widget.titleStyle ?? defaultTextStyle,
                ),
                RotationTransition(
                  turns: _iconTurns,
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: widget.iconColor ?? Color(0xFF1A5089),
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
        ClipRect(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Align(
                heightFactor: _heightFactor.value,
                child: child,
              );
            },
            child: Padding(
              padding: widget.contentPadding ??
                  const EdgeInsets.only(
                    top: 8.0,
                    bottom: 16.0,
                  ),
              child: widget.content,
            ),
          ),
        ),
      ],
    );
  }
}
