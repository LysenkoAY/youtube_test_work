import 'package:flutter/material.dart';

class SearchesSelector extends StatefulWidget {
  const SearchesSelector({
    super.key,
    required this.onSelect,
    required this.list,
  });

  final List<String> list;
  final Function(int search) onSelect;

  @override
  State<SearchesSelector> createState() => _SearchesSelectorState();
}

class _SearchesSelectorState extends State<SearchesSelector> {
  late int selected = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          widget.list.length,
          (index) => GestureDetector(
            onTap: () => setState(() {
              selected = index;
              widget.onSelect(index);
            }),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                  child: Row(
                    children: [
                      selected == index
                          ? const Padding(
                              padding: EdgeInsets.only(right: 8),
                              child: Icon(Icons.check, color: Colors.white),
                            )
                          : const SizedBox.shrink(),
                      Text(
                        widget.list[index],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
