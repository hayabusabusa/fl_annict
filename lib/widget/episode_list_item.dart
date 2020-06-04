import 'package:flutter/material.dart';

import 'package:fl_annict/entity/entity.dart';
import './spaced_horizontal_divider.dart';

class EpisodeListItem extends StatelessWidget {
  final Episode episode;

  const EpisodeListItem(this.episode);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Text(
                  episode.numberText,
                  style: TextStyle(
                    fontWeight: FontWeight.w700
                  ),
                ),
                const SizedBox(width: 8,),
                Expanded(
                  child: Text(
                    episode.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8,),
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}