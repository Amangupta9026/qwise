// ignore_for_file: avoid_renaming_method_parameters

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class BarChartSample2 extends StatefulWidget {
  const BarChartSample2({super.key});
  final Color coffeeColor = Colors.green;
  final Color teaColor = Colors.red;
  final Color milkColor = Colors.blue;
  @override
  State<StatefulWidget> createState() => BarChartSample2State();
}

class BarChartSample2State extends State<BarChartSample2> {
  final double width = 7;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;
  int touchedIndex = -1;
  DateTime? weeklyData;

  final date = DateTime.now();

  DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);

  DateTime get oneWeekData {
    final weekDay = date.weekday == 7 ? 0 : date.weekday;
    weeklyData = getDate(date.subtract(Duration(days: weekDay)));
    //  log('Start of week: ${getDate(date.subtract(Duration(days: weekDay)))}');
    return weeklyData!;
  }

  String getData(AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
    final eveningData = snapshot.data?.docs
        .map((e) {
          if (!e.data().containsKey('userlist')) {
            return 0;
          }
          return e.data()['userlist'].length;
        })
        .toList()
        .reduce((value, element) => value + element);
    return eveningData.toString();
  }

  Future<List<String>> getAllItems() async {
  
    final getAllData = await FirebaseFirestore.instance
        .collection('report')
        .doc(DateFormat('dd-MM-yyyy').format(date))
        .collection('morning')
        .get();
    List<String> items =
        getAllData.docs.map((e) => e.data()['title'].toString()).toList();

    //  List<GetData> items =
    //   getAllData.docs.map((e) => e.data()['title'].toString()).toList();

    final getEveningAllData = await FirebaseFirestore.instance
        .collection('report')
        .doc(DateFormat('dd-MM-yyyy').format(date))
        .collection('evening')
        .get();
    List<String> eveningitems = getEveningAllData.docs
        .map((e) => e.data()['title'].toString())
        .toList();

    items.addAll(eveningitems);
    items = items.toSet().toList();
    return items;
  }

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 5, 4, 12);
    final barGroup2 = makeGroupData(1, 16, 6, 12);
    final barGroup3 = makeGroupData(2, 18, 2, 5);
    final barGroup4 = makeGroupData(3, 20, 3, 16);
    final barGroup5 = makeGroupData(4, 17, 0, 6);
    final barGroup6 = makeGroupData(5, 19, 8, 1.5);
    final barGroup7 = makeGroupData(6, 10, 9, 1.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Report',
            style: TextStyle(color: Colors.white, fontSize: 20)),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('report')
                    .doc(DateFormat('dd-MM-yyyy').format(date))
                    .snapshots(),
                builder: (context, snapshot) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 1)),
                            child: const Column(children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Per Day',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              )
                            ]),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 1)),
                            child: const Column(children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'One Week',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              )
                            ]),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 1)),
                            child: const Column(children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'One Month',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              )
                            ]),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: 1)),
                              child: Column(children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Column(
                                    children: [
                                      const Text(
                                        'Morning',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                      StreamBuilder(
                                          stream: FirebaseFirestore.instance
                                              .collection('report')
                                              .doc(DateFormat('dd-MM-yyyy')
                                                  .format(date))
                                              .collection('morning')
                                              .snapshots(),
                                          builder: (context, snapshot) {
                                            return Text(
                                              '${getData(snapshot)} Cups',
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 28,
                                              ),
                                            );
                                          }),
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: 1)),
                              child: Column(children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Column(
                                    children: [
                                      const Text(
                                        'Evening',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                      StreamBuilder(
                                          stream: FirebaseFirestore.instance
                                              .collection('report')
                                              .doc(DateFormat('dd-MM-yyyy')
                                                  .format(date))
                                              .collection('evening')
                                              .snapshots(),
                                          builder: (context, snapshot) {
                                            return Text(
                                              '${getData(snapshot)} Cups',
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 28,
                                              ),
                                            );
                                          }),
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 45,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: BarChart(
                          BarChartData(
                            maxY: 20,
                            titlesData: FlTitlesData(
                              show: true,
                              rightTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: bottomTitles,
                                  reservedSize: 42,
                                ),
                              ),
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 28,
                                  interval: 5,
                                ),
                              ),
                            ),
                            borderData: FlBorderData(
                              show: false,
                            ),
                            barGroups: showingBarGroups,
                            gridData: FlGridData(show: false),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 10, top: 15, bottom: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 1,
                            )),
                        child: Column(
                          children: [
                            FutureBuilder(
                                future: getAllItems(),
                                builder: (context, snapshot) {
                                  return ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: snapshot.data?.length ?? 0,
                                      itemBuilder: (context, int index) {
                                        return StreamBuilder(
                                            stream: FirebaseFirestore.instance
                                                .collection('report')
                                                .doc(DateFormat('dd-MM-yyyy')
                                                    .format(date))
                                                .collection('morning')
                                                .doc(snapshot.data?[index])
                                                .snapshots(),
                                            builder: (context, snapshot) {
                                              return Row(
                                                children: [
                                                  const Text(
                                                    'd',
                                                    //   snapshot.data?[index] ?? '',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  LinearPercentIndicator(
                                                    barRadius:
                                                        const Radius.circular(
                                                            25),
                                                    width: 100.0,
                                                    lineHeight: 8.0,
                                                    percent: 0.5,
                                                    //  widget.listnerDisplayModel!.ratingReviews!
                                                    //         .rating5percent! /
                                                    //     100.toDouble(),
                                                    progressColor: Colors.green,
                                                  ),
                                                  const Text(
                                                    '20',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              );
                                            });
                                      });
                                }),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: widget.coffeeColor)),
                                const SizedBox(width: 8),
                                const Text(
                                  'Fruits',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                                const SizedBox(width: 20),
                                Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: widget.milkColor)),
                                const SizedBox(width: 8),
                                const Text(
                                  'Vegetables',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      //

                      const SizedBox(
                        height: 32,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 10, top: 15, bottom: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 1,
                            )),
                        child: Column(
                          children: [
                            const Text('Month wise drink data chart 2023-2024'),
                            const SizedBox(height: 30),
                            // circular chart

                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: PieChart(
                                PieChartData(
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                  sectionsSpace: 0,
                                  centerSpaceRadius: 40,
                                  sections: showingSections(),
                                ),
                              ),
                            ),

                            const SizedBox(height: 30),

                            Indicator(
                              color: widget.milkColor,
                              text: 'Milk',
                              isSquare: true,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Indicator(
                              color: widget.teaColor,
                              text: 'Tea',
                              isSquare: true,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Indicator(
                              color: widget.coffeeColor,
                              text: 'Coffee',
                              isSquare: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>['Mn', 'Te', 'Wd', 'Tu', 'Fr', 'St', 'Su'];

    final Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2, double y3) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: widget.coffeeColor,
          width: width,
        ),
        BarChartRodData(
          toY: y2,
          color: widget.teaColor,
          width: width,
        ),
        BarChartRodData(
          toY: y3,
          color: widget.milkColor,
          width: width,
        ),
      ],
    );
  }

  //
  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: widget.milkColor,
            value: 10,
            title: '10%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: widget.teaColor,
            value: 20,
            title: '20%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: widget.coffeeColor,
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              shadows: shadows,
            ),
          );

        default:
          throw Error();
      }
    });
  }
}

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.color,
    required this.text,
    required this.isSquare,
    this.size = 16,
    this.textColor,
  });
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        )
      ],
    );
  }
}

class GetData {
  final String? title;
  final double? length;

  GetData(
    this.title,
    this.length,
  );
  // == operator
  @override
  bool operator ==(o) => o is GetData && o.title == title;
  // hashcode
  @override
  int get hashCode => title.hashCode ^ length.hashCode;
}
