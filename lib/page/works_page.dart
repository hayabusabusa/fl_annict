import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fl_annict/notifier/notifier.dart';
import 'package:fl_annict/widget/widget.dart';

class WorksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('works'),
      ),
      body: context.select((WorksNotifier value) {
        return value.isLoading 
          ? Center(child: CircularProgressIndicator(),) 
          : ListView.separated(
            itemCount: value.works.length,
            separatorBuilder: (_, index) => const SpacedHorizontalDivider(lSpace: 120,),  // Image 104px + Space 16px
            itemBuilder: (_, index) => WorkListItem(
              work: value.works[index],
              onTap: () {},
            ), 
          );
      }) 
    );
  }
}