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
        height: 104,
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
                ? SizedBox(width: 88, child: Icon(Icons.broken_image)) 
                : CachedNetworkImage(
                  width: 88, 
                  fit: BoxFit.cover,
                  imageUrl: work.image,
                  errorWidget: (_, __, ___) => BrokenImage(width: 88,),
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