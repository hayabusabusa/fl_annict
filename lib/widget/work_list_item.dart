import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:fl_annict/entity/entity.dart';

class WorkListItem extends StatelessWidget {
  final Work work;

  WorkListItem({
    @required this.work,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('Tap');
      },
      child: Container(
        height: 104,
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Spacer
            const SizedBox(width: 8,),
            // Image
            Container(
              width: 88,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(work.image),
                  fit: BoxFit.cover,
                )
              ),
            ),
            // Spacer
            const SizedBox(width: 16,),
            // Texts
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    work.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                  ),
                  Text(work.season),
                ],
              ),
            ),
            // Spacer
            const SizedBox(width: 8,),
          ],
        ),
      ),
    );
  }
}