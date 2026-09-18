import 'package:flutter/material.dart';

class ScaleInText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Duration duration;

  const ScaleInText(
    this.text, {
    super.key,
    this.style,
    this.duration = const Duration(milliseconds: 800),
  });

  @override
  // ignore: library_private_types_in_public_api
  _ScaleInTextState createState() => _ScaleInTextState();
}

class _ScaleInTextState extends State<ScaleInText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: widget.duration)
      ..forward();
  }

  @override
  void didUpdateWidget(covariant ScaleInText old) {
    super.didUpdateWidget(old);
    if (old.text != widget.text || old.duration != widget.duration) {
      _ctrl.duration = widget.duration;
      _ctrl.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chars = widget.text.characters.toList();
    final n = chars.length;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(n, (i) {
        final start = i / n;
        final end = ((i + 1) / n).clamp(0.0, 1.0);

        final curved = CurvedAnimation(
          parent: _ctrl,
          curve: Interval(start, end, curve: Curves.easeOutBack),
        );

        final scale = Tween<double>(begin: 0.3, end: 1.0).animate(curved);

        return ScaleTransition(
          scale: scale,
          child: Text(chars[i], style: widget.style),
        );
      }),
    );
  }
}
