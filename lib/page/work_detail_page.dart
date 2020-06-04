import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:fl_annict/entity/entity.dart';
import 'package:fl_annict/model/model.dart'; // NOTE: Model を import している
import 'package:fl_annict/notifier/notifier.dart';
import 'package:fl_annict/widget/widget.dart';

class WorkDetailPage extends StatelessWidget {
  const WorkDetailPage._({Key key}): super(key: key);

  static Widget wrapped(Work work) {
    // TODO: 依存の関係がごちゃごちゃなので整理したい.
    return ChangeNotifierProvider(
      create: (_) => WorkDetailNotifier(WorkDetailModel(work.id), work: work),
      child: const WorkDetailPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final work = context.select((WorkDetailNotifier value) => value.work);
    final episodes = context.select((WorkDetailNotifier value) => value.episode);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          // AppBar
          SliverAppBar(
            snap: true,
            floating: true,
            pinned: true,
            stretch: true,
            expandedHeight: MediaQuery.of(context).size.height / 3.5, // Screen.height / 4
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: work.image == null 
                ? BrokenImage() 
                : CachedNetworkImage(
                  imageUrl: work.image,
                  fit: BoxFit.cover,
                  errorWidget: (_, __, ___) => BrokenImage()
                ),
            ),
          ),
          // Body
          SliverPadding(
            padding: const EdgeInsets.all(16),
            // Title Section
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Text(
                  work.title,
                  style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,),
                ),
                const SizedBox(height: 4),
                Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 8,
                  children: <Widget>[
                    BorderedChip(text: work.media),
                    BorderedChip(text: work.season),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      IconText(icon: Icons.info, text: work.watchersCount.toString()),
                      const VerticalDivider(),
                      IconText(icon: Icons.info, text: work.watchersCount.toString()),
                    ],
                  ),
                ),
              ]),
            ),
          ),
          // Divider
          SliverToBoxAdapter(
            child: SpacedHorizontalDivider(color: Colors.grey[200])
          ),
          // Episodes
          context.select((WorkDetailNotifier value) => value.isLoading 
            ? SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: SizedBox(width: 24, height: 24, child: CircularProgressIndicator()),
              )
            )
            : SliverList(delegate: SliverChildListDelegate(episodes.map((e) => Text(e.title)).toList())),
          ),
        ],
      ),
    );
  }
}