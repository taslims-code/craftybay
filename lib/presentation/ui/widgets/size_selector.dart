import 'package:flutter/material.dart';

import '../utility/app_colors.dart';

class SizeSelector extends StatefulWidget {
  const SizeSelector({
    super.key,
    required this.sizes,
    required this.initialSelected,
    required this.onSelected,
  });

  final List<String> sizes;
  final int initialSelected;
  final Function(int selectedIndex) onSelected;

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  int _selectedSizeIndex = 0;

  @override
  void initState() {
    _selectedSizeIndex = widget.initialSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.sizes.length,
        itemBuilder: (context, index) {
          return InkWell(
            borderRadius: BorderRadius.circular(4),
            onTap: () {
              _selectedSizeIndex = index;
              widget.onSelected(index);
              if (mounted) {
                setState(() {});
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                  color: _selectedSizeIndex == index
                      ? AppColors.primaryColor
                      : null),
              alignment: Alignment.center,
              child: Text(widget.sizes[index]),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 8,
          );
        },
      ),
    );
  }
}
