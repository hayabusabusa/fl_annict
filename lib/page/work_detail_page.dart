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
            expandedHeight: MediaQuery.of(context).size.height / 3, // Screen.height / 4
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
                // Title
                Text(
                  work.title,
                  style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,),
                ),
                // Spacer
                const SizedBox(height: 4),
                // Season
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
                // Spacer
                const SizedBox(height: 4),
                // Counts
                IconText(icon: Icons.info, text: '全 ${work.episodesCount} 話'),
                const SizedBox(height: 4),
                IconText(icon: Icons.watch_later, text: '${work.watchersCount} 人がチェック'),
                // Spacer
                const SizedBox(height: 16),
                // Social Buttons
                Container(
                  height: 32,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SocialButton(type: SocialType.twitter, onPressed: () {},),
                      const VerticalDivider(),
                      SocialButton(type: SocialType.official, onPressed: () {},),
                      const VerticalDivider(),
                      SocialButton(type: SocialType.wikipedia, onPressed: () {},),
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
            : SliverPadding(
              padding: const EdgeInsets.only(top: 8, left: 20),
              sliver: SliverList(delegate: SliverChildListDelegate(episodes.map((e) => EpisodeListItem(e)).toList())),
            ),
          ),
        ],
      ),
    );
  }
}