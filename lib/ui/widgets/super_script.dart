// This is how I declare global widgets, used accross differnet UI funnels.

import 'package:flutter/material.dart';

class SuperScript extends StatefulWidget {
  final Widget parent;
  final String text;
  const SuperScript({super.key, required this.parent, required this.text});

  @override
  State<SuperScript> createState() => _SuperScriptState();
}

class _SuperScriptState extends State<SuperScript> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      child: Stack(
        children: [
          widget.parent,
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 11,
              height: 8,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: Color(0xFF8B88EF),
              ),
              child: Center(
                child: Text(widget.text,
                    style: const TextStyle(color: Colors.black, fontSize: 6)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
