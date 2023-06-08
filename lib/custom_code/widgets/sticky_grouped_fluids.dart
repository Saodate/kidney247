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

class StickyGroupedFluids extends StatefulWidget {
  const StickyGroupedFluids({
    Key? key,
    this.width,
    this.height,
    required this.listFluids,
    required this.dateColor,
    required this.textColor,
    required this.primaryColor,
    required this.emptyString,
    required this.dateBorderColor,
    required this.removeFluid,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<FluidsRecord> listFluids;
  final Color dateColor;
  final String emptyString;
  final Color primaryColor;
  final Color textColor;
  final Color dateBorderColor;
  final Future<dynamic> Function() removeFluid;

  @override
  _StickyGroupedFluidsState createState() => _StickyGroupedFluidsState();
}

class _StickyGroupedFluidsState extends State<StickyGroupedFluids> {
  @override
  Widget build(BuildContext context) {
    return widget.listFluids.isEmpty
        ? Center(
            child: Text(
              widget.emptyString,
              style: TextStyle(
                  fontFamily: 'Primary Family',
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          )
        : StickyGroupedListView<FluidsRecord, DateTime>(
            elements: widget.listFluids,
            stickyHeaderBackgroundColor: widget.primaryColor,
            order: StickyGroupedListOrder.ASC,
            groupBy: (FluidsRecord element) => DateTime(element.createdAt!.year,
                element.createdAt!.month, element.createdAt!.day),
            groupComparator: (DateTime value1, DateTime value2) =>
                value2.compareTo(value1),
            itemComparator: (FluidsRecord element1, FluidsRecord element2) =>
                element2.createdAt!.compareTo(element1.createdAt!),
            groupSeparatorBuilder: _getGroupSeparator,
            itemBuilder: _getItem,
          );
  }

  Widget _getGroupSeparator(FluidsRecord element) {
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
              '${element.createdAt!.day}/${element.createdAt!.month}/${element.createdAt!.year}',
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

  Widget _getItem(BuildContext ctx, FluidsRecord element) {
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
                '${element.amount!}l',
                style: TextStyle(
                    fontFamily: 'Primary Family',
                    color: widget.textColor,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '${DateFormat('hh:mm a').format(element.createdAt!)}',
                style: TextStyle(
                    fontFamily: 'Primary Family',
                    color: widget.textColor,
                    fontWeight: FontWeight.bold),
              ),
              trailing: GestureDetector(
                child: Icon(Icons.delete, color: widget.textColor),
                onTap: () {
                  FFAppState().fluid = element.reference;
                  widget.removeFluid();
                },
              )),
        ));
  }
}
