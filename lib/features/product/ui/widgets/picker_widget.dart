import 'package:ecommerce_project/app/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PickerWidget extends StatefulWidget {
  final String title;
  final List<String> items;
  final Function(String) onChanged;

  const PickerWidget({super.key, required this.title, required this.items, required this.onChanged});

  @override
  State<PickerWidget> createState() => _PickerWidgetState();
}

class _PickerWidgetState extends State<PickerWidget> {
  String? selected;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // * TITLE
        Text(
          "${widget.title}",
          style: Theme.of(context).textTheme.titleMedium,
        ),

        const Gap(8),
        // * PICKER
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: getPickers(),
          ),
        )
      ],
    );
  }

  List<Widget> getPickers() {
    List<Widget> pickers = [];
    for (String item in widget.items) {
      pickers.add(
        pickerItem(
          items: item,
          onChanged: () {
            selected = item;
            setState(() {});
            widget.onChanged(item);
          },
          selected: selected == item,
        ),
      );
    }
    return pickers;
  }

  Widget pickerItem(
      {required String items,
      required VoidCallback onChanged,
      required bool selected}) {
    return GestureDetector(
      onTap: onChanged,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected
              ? SullionAppColor.primaryBlackColor
              : SullionAppColor.primarygreyColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          items,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: selected
                    ? SullionAppColor.primaryBackgroundColor
                    : SullionAppColor.primaryBlackColor,
              ),
        ),
      ),
    );
  }
}
