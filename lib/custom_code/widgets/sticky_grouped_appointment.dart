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

class StickyGroupedAppointment extends StatefulWidget {
  const StickyGroupedAppointment(
      {Key? key,
      this.width,
      this.height,
      required this.listAppointment,
      required this.dateColor,
      required this.textColor,
      required this.primaryColor,
      required this.dateBorderColor,
      required this.editAppointment,
      required this.language,
      required this.deleteAppointment})
      : super(key: key);

  final double? width;
  final double? height;
  final List<AppointmentsRecord> listAppointment;
  final Color dateColor;
  final Color primaryColor;
  final Color textColor;
  final Color dateBorderColor;
  final String language;
  final Future<dynamic> Function() editAppointment;
  final Future<dynamic> Function() deleteAppointment;

  @override
  _StickyGroupedAppointmentState createState() =>
      _StickyGroupedAppointmentState();
}

class _StickyGroupedAppointmentState extends State<StickyGroupedAppointment> {
  @override
  Widget build(BuildContext context) {
    return StickyGroupedListView<AppointmentsRecord, DateTime>(
      elements: widget.listAppointment,
      stickyHeaderBackgroundColor: widget.primaryColor,
      order: StickyGroupedListOrder.ASC,
      groupBy: (AppointmentsRecord element) => DateTime(element.createdAt!.year,
          element.createdAt!.month, element.createdAt!.day),
      groupComparator: (DateTime value1, DateTime value2) =>
          value2.compareTo(value1),
      itemComparator:
          (AppointmentsRecord element1, AppointmentsRecord element2) =>
              element2.createdAt!.compareTo(element1.createdAt!),
      groupSeparatorBuilder: _getGroupSeparator,
      itemBuilder: _getItem,
    );
  }

  Widget _getGroupSeparator(AppointmentsRecord element) {
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

  Widget _getItem(BuildContext ctx, AppointmentsRecord element) {
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
                element.doctorAddress!,
                style: TextStyle(
                    fontFamily: 'Primary Family',
                    color: widget.textColor,
                    fontWeight: FontWeight.bold),
              ),
              title: Text(
                element.doctorName!,
                style: TextStyle(
                    fontFamily: 'Primary Family',
                    color: widget.textColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            collapsed: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.language == 'en'
                          ? '${DateFormat('EEEE, d MMMM hh:mm a', 'en').format(element.appointmentDateTime!)}'
                          : '${DateFormat('EEEE, d MMMM hh:mm a', 'vi').format(element.appointmentDateTime!)}',
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
                          widget.editAppointment();
                        },
                      ),
                      GestureDetector(
                        child: Icon(
                          Icons.delete_rounded,
                          color: widget.textColor,
                        ),
                        onTap: () {
                          FFAppState().appointmentRef = element.reference;
                          widget.deleteAppointment();
                        },
                      ),
                    ])
                  ]),
            ),
            expanded: buildExpanded(element),
          ),
        ));
  }

  buildExpanded(AppointmentsRecord element) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Text(
          element.description!,
          style: TextStyle(
              fontFamily: 'Primary Family',
              color: widget.textColor,
              fontWeight: FontWeight.bold),
        ));
  }
}
