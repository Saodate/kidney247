// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:sticky_grouped_list/sticky_grouped_list.dart';

class StickyGroupedAlbumin extends StatefulWidget {
  const StickyGroupedAlbumin({
    Key? key,
    this.width,
    this.height,
    required this.listLabtest,
    required this.dateColor,
    required this.textColor,
    required this.primaryColor,
    required this.emptyString,
    required this.dateBorderColor,
    required this.editLabTest,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<LabtestResultsRecord> listLabtest;
  final Color dateColor;
  final String emptyString;
  final Color primaryColor;
  final Color textColor;
  final Color dateBorderColor;
  final Future<dynamic> Function() editLabTest;

  @override
  _StickyGroupedAlbuminState createState() => _StickyGroupedAlbuminState();
}

class _StickyGroupedAlbuminState extends State<StickyGroupedAlbumin> {
  @override
  Widget build(BuildContext context) {
    List<LabtestResultsRecord> temp = [];
    for (LabtestResultsRecord item in widget.listLabtest) {
      if (item.albumin != 0) {
        temp.add(item);
      }
    }
    return temp.isEmpty
        ? Center(
            child: Text(
              widget.emptyString,
              style: TextStyle(
                  fontFamily: 'Primary Family',
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          )
        : StickyGroupedListView<LabtestResultsRecord, DateTime>(
            elements: temp,
            stickyHeaderBackgroundColor: widget.primaryColor,
            order: StickyGroupedListOrder.ASC,
            groupBy: (LabtestResultsRecord element) => DateTime(
                element.albuminTime!.year,
                element.albuminTime!.month,
                element.albuminTime!.day),
            groupComparator: (DateTime value1, DateTime value2) =>
                value2.compareTo(value1),
            itemComparator: (LabtestResultsRecord element1,
                    LabtestResultsRecord element2) =>
                element2.albuminTime!.compareTo(element1.albuminTime!),
            groupSeparatorBuilder: _getGroupSeparator,
            itemBuilder: _getItem,
          );
  }

  Widget _getGroupSeparator(LabtestResultsRecord element) {
    return SizedBox(
      height: 50,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: 120,
          decoration: BoxDecoration(
            color: widget.dateColor,
            border: Border.all(
              color: widget.dateBorderColor,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${element.albuminTime!.day}/${element.albuminTime!.month}/${element.albuminTime!.year}',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Primary Family',
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getItem(BuildContext ctx, LabtestResultsRecord element) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      elevation: 8.0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: SizedBox(
          child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              title: Text(
                '${element.albumin!}g/dL',
                style: TextStyle(
                    fontFamily: 'Primary Family',
                    color: widget.textColor,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '${DateFormat('hh:mm a').format(element.albuminTime!)}',
                style: TextStyle(
                    fontFamily: 'Primary Family',
                    color: widget.textColor,
                    fontWeight: FontWeight.bold),
              ),
              trailing: GestureDetector(
                child: Icon(
                  Icons.edit_note_rounded,
                  color: widget.textColor,
                ),
                onTap: () {
                  FFAppState().editLabTest = element.reference;
                  widget.editLabTest();
                },
              ))),
    );
  }
}
