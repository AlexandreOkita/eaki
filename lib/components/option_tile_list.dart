import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OptionTileList extends ConsumerStatefulWidget {
  final List<String> items;
  final StateProvider<String>? provider;
  const OptionTileList({this.provider, required this.items, Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OptionTileListState();
}

class _OptionTileListState extends ConsumerState<OptionTileList> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screen = MediaQuery.of(context).size;
    return SizedBox(
      height: screen.height * 0.3,
      child: ListView.separated(
        addAutomaticKeepAlives: false,
        itemCount: widget.items.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: selectedIndex == index ? const Color(0x303A76CA) : const Color(0x00ffffff),
            child: ListTile(
              onTap: () => setState(() {
                selectedIndex = index;
                if (widget.provider != null) {
                  ref.read(widget.provider!.notifier).state = widget.items[selectedIndex];
                }
              }),
              title: Text(
                widget.items[index],
                style: textTheme.bodyText1,
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }
}
