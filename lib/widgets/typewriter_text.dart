import 'package:flutter/material.dart';

class TypeWriterText extends StatefulWidget {
  final String text;
  final Duration speed;
  final TextStyle? style;
  final TextAlign? textAlign;

  const TypeWriterText(
    this.text, {
    super.key,
    this.speed = const Duration(milliseconds: 80),
    this.style,
    this.textAlign,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TypeWriterTextState createState() => _TypeWriterTextState();
}

class _TypeWriterTextState extends State<TypeWriterText> {
  String shown = "";
  int index = 0;

  @override
  void initState() {
    super.initState();
    _tick();
  }

  void _tick() async {
    while (index < widget.text.length) {
      await Future.delayed(widget.speed);
      setState(() => shown += widget.text[index]);
      index++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(shown, style: widget.style, textAlign: widget.textAlign);
  }
}
