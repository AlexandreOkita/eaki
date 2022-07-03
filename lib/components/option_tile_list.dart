import 'package:eaki/components/not_mapped_button.dart';
import 'package:eaki/components/open_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OptionTileList extends ConsumerStatefulWidget {
  final List<String> items;
  final AutoDisposeStateProvider<String>? provider;
  const OptionTileList({this.provider, required this.items, Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OptionTileListState();
}

class _OptionTileListState extends ConsumerState<OptionTileList> {
  int selectedIndex = -1;
  String search = "";
  List<String>? filteredItems;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final _scrollController = ScrollController();
    if (search != "") {
      filteredItems = widget.items.where((item) => item.toLowerCase().contains(search.toLowerCase())).toList();
    } else {
      filteredItems = widget.items;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        OpenTextInput(
          labelText: "Pesquisar Especialidade",
          onFieldChanged: (value) => setState(() {
            search = value;
          }),
        ),
        const SizedBox(
          height: 10,
        ),
        const NotMappedButton(text: "Não encontrei minha especialidade"),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          
          child: Scrollbar(
            thumbVisibility: true,
            controller: _scrollController,
            child: ListView.separated(
              controller: _scrollController,
              itemCount: filteredItems?.length ?? widget.items.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: selectedIndex == index ? const Color(0x303A76CA) : const Color(0x00ffffff),
                  child: ListTile(
                    onTap: () => setState(() {
                      selectedIndex = index;
                      if (widget.provider != null) {
                        ref.read(widget.provider!.notifier).state =
                            filteredItems?[selectedIndex] ?? widget.items[selectedIndex];
                      }
                    }),
                    title: Text(
                      filteredItems?[index] ?? widget.items[index],
                      style: textTheme.bodyText1,
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            ),
          ),
        ),
      ],
    );
  }
}
