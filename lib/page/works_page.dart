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
            separatorBuilder: (_, index) => SpacedHorizontalDivider(lSpace: 88, color: Colors.grey[200],), 
            itemBuilder: (_, index) => WorkListItem(work: value.works[index]), 
          );
      }) 
    );
  }
}