import 'package:flutter/material.dart';
import 'package:news_app/models/sources.dart';
import 'package:news_app/news/news_content.dart';
import 'package:news_app/tabs/tab_item.dart';

class SourcesTabs extends StatefulWidget {
  List<Sources> source;
  SourcesTabs(this.source);

  @override
  State<SourcesTabs> createState() => _SourcesTabsState();
}

class _SourcesTabsState extends State<SourcesTabs> {
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.source.length,
          child: TabBar(
              isScrollable: true,
              indicatorColor: Colors.transparent,
              onTap: (index) => setState(() {
                selectedIndex=index;
              }),
              tabs:widget.source.map((sourceItem) => TabItem(
                source: sourceItem,
                isSelected: selectedIndex== widget.source.indexOf(sourceItem),
              )
              ).toList()
          ),
        ),
        Expanded(
            child: NewsList(sourceId:  widget.source[selectedIndex].id ??''
            )
        )
      ],
    );
  }
}
