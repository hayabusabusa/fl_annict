import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:fl_annict/entity/entity.dart';
import 'package:fl_annict/notifier/notifier.dart';
import 'package:fl_annict/widget/widget.dart';

class WorkDetailPage extends StatelessWidget {
  const WorkDetailPage._({Key key}): super(key: key);

  static Widget wrapped(Work work) {
    return ChangeNotifierProvider(
      create: (_) => WorkDetailNotifier(work),
      child: const WorkDetailPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final work = context.select((WorkDetailNotifier value) => value.work);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          // AppBar
          SliverAppBar(
            title: Text(work.title),
            snap: true,
            floating: true,
            pinned: true,
            stretch: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: work.image == null 
                ? BrokenImage() 
                : CachedNetworkImage(
                  imageUrl: work.image,
                  fit: BoxFit.cover,
                ),
            ),
          ),
          // Body
          SliverFillRemaining(
            child: Center(child: Text('Body'))
          )
        ],
      ),
    );
  }
}