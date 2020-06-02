import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:fl_annict/entity/entity.dart';
import 'package:fl_annict/widget/widget.dart';

class WorkListItem extends StatelessWidget {
  final Work work;
  final VoidCallback onTap;

  WorkListItem({
    @required this.work,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 112,
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Spacer
            const SizedBox(width: 8,),
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: work.image == null 
                ? SizedBox(width: 96, child: Icon(Icons.broken_image)) 
                : CachedNetworkImage(
                  width: 96, 
                  fit: BoxFit.cover,
                  imageUrl: work.image,
                  errorWidget: (_, __, ___) => BrokenImage(width: 96,),
                ),
            ),
            // Spacer
            const SizedBox(width: 16,),
            // Texts
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Title
                  Text(
                    work.title,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                   // Media
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                    child: Text(work.media, style: TextStyle(color: Colors.white),),
                    decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(999)),
                  ),
                  // Spacer
                  const Expanded(child: const SizedBox()),
                  // Episodes, Watchers
                  Row(
                    children: <Widget>[
                      IconText(icon: Icons.info, text: '${work.episodesCount}話'),
                      const SizedBox(width: 8),
                      IconText(icon: Icons.watch_later, text: '${work.watchersCount}人がチェック'),
                    ],
                  ),
                ],
              ),
            ),
            // Spacer
            const SizedBox(width: 8,),
            // Disclosure indicator
            const Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}