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

import 'package:expandable/expandable.dart';
import 'package:sticky_grouped_list/sticky_grouped_list.dart';

class StickyGroupedMedicationRemind extends StatefulWidget {
  const StickyGroupedMedicationRemind(
      {Key? key,
      this.width,
      this.height,
      required this.listMedicationRemind,
      required this.dateColor,
      required this.textColor,
      required this.primaryColor,
      required this.dateBorderColor,
      required this.editMedicationRemind,
      required this.language,
      required this.deleteMedicationRemind})
      : super(key: key);

  final double? width;
  final double? height;
  final List<MedicationRemindRecord> listMedicationRemind;
  final Color dateColor;
  final Color primaryColor;
  final Color textColor;
  final Color dateBorderColor;
  final String language;
  final Future<dynamic> Function() editMedicationRemind;
  final Future<dynamic> Function() deleteMedicationRemind;

  @override
  _StickyGroupedMedicationRemindState createState() =>
      _StickyGroupedMedicationRemindState();
}

class _StickyGroupedMedicationRemindState
    extends State<StickyGroupedMedicationRemind> {
  @override
  Widget build(BuildContext context) {
    return StickyGroupedListView<MedicationRemindRecord, DateTime>(
      elements: widget.listMedicationRemind,
      stickyHeaderBackgroundColor: widget.primaryColor,
      order: StickyGroupedListOrder.ASC,
      groupBy: (MedicationRemindRecord element) => DateTime(
          element.createdAt!.year,
          element.createdAt!.month,
          element.createdAt!.day),
      groupComparator: (DateTime value1, DateTime value2) =>
          value2.compareTo(value1),
      itemComparator:
          (MedicationRemindRecord element1, MedicationRemindRecord element2) =>
              element2.createdAt!.compareTo(element1.createdAt!),
      groupSeparatorBuilder: _getGroupSeparator,
      itemBuilder: _getItem,
    );
  }

  Widget _getGroupSeparator(MedicationRemindRecord element) {
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

  Widget _getItem(BuildContext ctx, MedicationRemindRecord element) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        elevation: 8.0,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: SizedBox(
          child: ExpandablePanel(
            header: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              subtitle: Text(
                widget.language == 'en'
                    ? 'Take in: ${element.remindTime!.length} days'
                    : 'Uống trong: ${element.remindTime!.length} ngày',
                style: TextStyle(
                    fontFamily: 'Primary Family',
                    color: widget.textColor,
                    fontWeight: FontWeight.bold),
              ),
              title: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: element.session!.length,
                itemBuilder: (ctx, i) {
                  return Text(
                    element.session![i],
                    style: TextStyle(
                        fontFamily: 'Primary Family',
                        color: widget.textColor,
                        fontWeight: FontWeight.bold),
                  );
                },
              ),
            ),
            collapsed: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      element.note!,
                      style: TextStyle(
                          fontFamily: 'Primary Family',
                          color: widget.textColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(children: [
                      GestureDetector(
                        child: Icon(
                          Icons.edit_note_rounded,
                          color: widget.textColor,
                        ),
                        onTap: () {
                          FFAppState().appointmentRef = element.reference;
                          widget.editMedicationRemind();
                        },
                      ),
                      GestureDetector(
                        child: Icon(
                          Icons.delete_rounded,
                          color: widget.textColor,
                        ),
                        onTap: () {
                          FFAppState().appointmentRef = element.reference;
                          widget.deleteMedicationRemind();
                        },
                      ),
                    ])
                  ]),
            ),
            expanded: buildExpanded(element),
          ),
        ));
  }

  buildExpanded(MedicationRemindRecord element) {
    // return StreamBuilder<MedicationRecord>(
    //     stream: MedicationRecord.getDocument(toRef(element.medicationRef!)),
    //     builder: (context, snapshot) {
    //       // Customize what your widget looks like when it's loading.
    //       if (!snapshot.hasData) {
    //         return Center();
    //       }
    //       return Container();
    //     });
    return Container();
  }
}
