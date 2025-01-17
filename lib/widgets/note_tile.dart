// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_size_text/auto_size_text.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

// Project imports:
import 'package:safenotes/models/safenote.dart';
import 'package:safenotes/utils/color.dart';

class NoteTileWidget extends StatelessWidget {
  final SafeNote note;
  final int index;

  const NoteTileWidget({
    Key? key,
    required this.note,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Pick colors from the accent colors based on index
    final color = NotesColor.getNoteColor(notIndex: index);
    final fontColor = getFontColorForBackground(color);
    DateTime now = DateTime.now();
    DateTime todayDate = DateTime(now.year, now.month, now.day);
    DateTime noteDate = DateTime(
        note.createdTime.year, note.createdTime.month, note.createdTime.day);
    String time = (todayDate == noteDate)
        ? timeago.format(note.createdTime)
        : DateFormat.yMMMd().format(note.createdTime);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            note.title,
            style: TextStyle(
              color: fontColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            minFontSize: 20,
            maxLines: 1,
            overflow: TextOverflow.clip,
          ),
          SizedBox.square(dimension: 5),
          Text(
            time,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: fontColor,
            ),
          ),
          SizedBox.square(dimension: 5),
          AutoSizeText(
            note.description,
            style: TextStyle(
              color: fontColor,
              fontSize: 16,
            ),
            minFontSize: 16,
            maxLines: 2,
            overflow: TextOverflow.clip,
          ),
        ],
      ),
    );
  }
}
