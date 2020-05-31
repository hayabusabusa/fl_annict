import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fl_annict/notifier/notifier.dart';

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
          : GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
            itemCount: value.works.length,
            itemBuilder: (context, index) => Container(
              child: Image.network(
                value.works[index].image,
                fit: BoxFit.cover,
              ),
            ),
          );
      }) 
    );
  }
}