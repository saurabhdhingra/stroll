import 'package:flutter/material.dart';

class SuperScript extends StatefulWidget {
  final Widget parent;
  const SuperScript({super.key, required this.parent});

  @override
  State<SuperScript> createState() => _SuperScriptState();
}

class _SuperScriptState extends State<SuperScript> {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Stack(children: [Container(decoration: BoxDecoration(color),), widget.parent],));
  }
}
