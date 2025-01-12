import 'package:flutter/material.dart';

class OptionTile extends StatefulWidget {
  final String label;
  final String text;
  final bool isSelected;

  const OptionTile({
    Key? key,
    required this.label,
    required this.text,
    required this.isSelected,
  }) : super(key: key);

  @override
  State<OptionTile> createState() => _OptionTileState();
}

class _OptionTileState extends State<OptionTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 6,
      ),
      child: Container(
        width: 185,
        height: 70,
        decoration: BoxDecoration(
          color: const Color(0xFF232A2E),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: widget.isSelected
                  ? const Color(0xFF8B88EF)
                  : const Color(0xFF232A2E),
              width: 2),
        ),
        child: Center(
          child: ListTile(
            leading: Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                color: widget.isSelected
                    ? const Color(0xFF8B88EF)
                    : const Color(0xFF232A2E),
                border: widget.isSelected
                    ? null
                    : Border.all(color: Color(0xFFC4C4C4), width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  widget.label,
                  style: TextStyle(
                    color: widget.isSelected
                        ? Colors.white
                        : const Color(0xFFC4C4C4),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            title: Text(
              widget.text,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFFC4C4C4),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
