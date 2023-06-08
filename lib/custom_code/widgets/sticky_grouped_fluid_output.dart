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

class StickyGroupedFluidOutput extends StatefulWidget {
  const StickyGroupedFluidOutput(
      {Key? key,
      this.width,
      this.height,
      required this.listVitals,
      required this.dateColor,
      required this.textColor,
      required this.primaryColor,
      required this.emptyString,
      required this.dateBorderColor,
      required this.editVital})
      : super(key: key);

  final double? width;
  final double? height;
  final List<VitalsResultRecord> listVitals;
  final Color dateColor;
  final String emptyString;
  final Color primaryColor;
  final Color textColor;
  final Color dateBorderColor;
  final Future<dynamic> Function() editVital;

  @override
  _StickyGroupedFluidOutputState createState() =>
      _StickyGroupedFluidOutputState();
}

class _StickyGroupedFluidOutputState extends State<StickyGroupedFluidOutput> {
  @override
  Widget build(BuildContext context) {
    List<VitalsResultRecord> temp = [];
    for (VitalsResultRecord item in widget.listVitals) {
      if (item.fluidOutput != 0) {
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
        : StickyGroupedListView<VitalsResultRecord, DateTime>(
            elements: temp,
            stickyHeaderBackgroundColor: widget.primaryColor,
            order: StickyGroupedListOrder.ASC,
            groupBy: (VitalsResultRecord element) => DateTime(
                element.fluidOutputTime!.year,
                element.fluidOutputTime!.month,
                element.fluidOutputTime!.day),
            groupComparator: (DateTime value1, DateTime value2) =>
                value2.compareTo(value1),
            itemComparator: (VitalsResultRecord element1,
                    VitalsResultRecord element2) =>
                element2.fluidOutputTime!.compareTo(element1.fluidOutputTime!),
            groupSeparatorBuilder: _getGroupSeparator,
            itemBuilder: _getItem,
          );
  }

  Widget _getGroupSeparator(VitalsResultRecord element) {
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
              '${element.fluidOutputTime!.day}/${element.fluidOutputTime!.month}/${element.fluidOutputTime!.year}',
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

  Widget _getItem(BuildContext ctx, VitalsResultRecord element) {
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
                '${element.fluidOutput!}l',
                style: TextStyle(
                    fontFamily: 'Primary Family',
                    color: widget.textColor,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '${DateFormat('hh:mm a').format(element.fluidOutputTime!)}',
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
                  FFAppState().editVital = element.reference;
                  widget.editVital();
                },
              ))),
    );
  }
}
