import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fl_annict/notifier/notifier.dart';
import 'package:fl_annict/page/page.dart';
import 'package:fl_annict/widget/widget.dart';

class WorksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final works = context.select((WorksNotifier value) => value.works);
    return Scaffold(
      appBar: AppBar(
        title: Text('works'),
      ),
      body: context.select((WorksNotifier value) => value.isLoading 
        ? Center(child: CircularProgressIndicator(),) 
        : Scrollbar(
          child: ListView.separated(
            itemCount: works.length,
            controller: value.scrollController,
            separatorBuilder: (_, index) => const SpacedHorizontalDivider(lSpace: 120,),  // Image 104px + Space 16px
            itemBuilder: (_, index) => WorkListItem(
              work: works[index], 
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => WorkDetailPage.wrapped(works[index]))
                );
              },
            ),
          ),
        )
      )
    );
  }
}