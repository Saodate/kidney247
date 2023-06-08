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

class StickyGroupedMeals extends StatefulWidget {
  const StickyGroupedMeals({
    Key? key,
    this.width,
    this.height,
    required this.listMeals,
    required this.dateColor,
    required this.textColor,
    required this.primaryColor,
    required this.emptyString,
    required this.dateBorderColor,
    required this.language,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<MealsRecord> listMeals;
  final Color dateColor;
  final String emptyString;
  final Color primaryColor;
  final Color textColor;
  final Color dateBorderColor;
  final String language;

  @override
  _StickyGroupedMealsState createState() => _StickyGroupedMealsState();
}

class _StickyGroupedMealsState extends State<StickyGroupedMeals> {
  @override
  Widget build(BuildContext context) {
    return widget.listMeals.isEmpty
        ? Center(
            child: Text(
              widget.emptyString,
              style: TextStyle(
                  fontFamily: 'Primary Family',
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          )
        : StickyGroupedListView<MealsRecord, DateTime>(
            elements: widget.listMeals,
            stickyHeaderBackgroundColor: widget.primaryColor,
            order: StickyGroupedListOrder.ASC,
            groupBy: (MealsRecord element) => DateTime(element.createdAt!.year,
                element.createdAt!.month, element.createdAt!.day),
            groupComparator: (DateTime value1, DateTime value2) =>
                value2.compareTo(value1),
            itemComparator: (MealsRecord element1, MealsRecord element2) =>
                element2.createdAt!.compareTo(element1.createdAt!),
            groupSeparatorBuilder: _getGroupSeparator,
            itemBuilder: _getItem,
          );
  }

  Widget _getGroupSeparator(MealsRecord element) {
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

  Widget _getItem(BuildContext ctx, MealsRecord element) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      elevation: 8.0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: SizedBox(
        child: ExpandablePanel(
          header: ListTile(
              leading: Image.network(
                element.photo! ??
                    'https://assets.materialup.com/uploads/b03b23aa-aa69-4657-aa5e-fa5fef2c76e8/preview.png',
                height: 100,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              subtitle: Text(
                '${element.qty} ${element.unit}',
                style: TextStyle(
                    fontFamily: 'Primary Family',
                    color: widget.textColor,
                    fontWeight: FontWeight.bold),
              ),
              title: Text(
                element.name!,
                style: TextStyle(
                    fontFamily: 'Primary Family',
                    color: widget.textColor,
                    fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                '${DateFormat('hh:mm a').format(element.createdAt!)}',
                style: TextStyle(
                    fontFamily: 'Primary Family',
                    color: widget.textColor,
                    fontWeight: FontWeight.bold),
              )),
          collapsed: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text(
              widget.language == 'en'
                  ? 'Calories: ${element.calories}kcal'
                  : 'Lượng calo: ${element.calories}kcal',
              style: TextStyle(
                  fontFamily: 'Primary Family',
                  color: widget.textColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          expanded: buildExpanded(element),
        ),
      ),
    );
  }

  buildExpanded(MealsRecord element) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.language == 'en'
                ? 'Fluid: ${element.fluid}l'
                : 'Lượng nước: ${element.fluid}l',
            style: TextStyle(
                fontSize: 12,
                fontFamily: 'Primary Family',
                color: widget.textColor,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.language == 'en'
                    ? 'Protein: ${element.protein}g'
                    : 'Chất đạm: ${element.protein}g',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Primary Family',
                    color: widget.textColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.language == 'en'
                    ? 'Phosphorus: ${element.phosphorus}mg'
                    : 'Phốt pho: ${element.phosphorus}mg',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Primary Family',
                    color: widget.textColor,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.language == 'en'
                    ? 'Potassium: ${element.potassium}mg'
                    : 'Kali: ${element.potassium}mg',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Primary Family',
                    color: widget.textColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.language == 'en'
                    ? 'Sodium: ${element.sodium}mg'
                    : 'Natri: ${element.sodium}mg',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Primary Family',
                    color: widget.textColor,
                    fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
