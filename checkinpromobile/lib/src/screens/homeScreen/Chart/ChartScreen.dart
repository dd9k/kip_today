import 'package:async/async.dart';
import 'package:checkinpromobile/src/screens/MainScreen.dart';
import 'package:checkinpromobile/src/screens/homeScreen/Chart/ChartNotifier.dart';
import 'package:checkinpromobile/src/widgetUtilities/SwipeDetector.dart';

/// Package import
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../model/Chart.dart';
import 'package:checkinpromobile/src/constants/AppColors.dart';

/// Render the horizontal gradient.
// ignore: must_be_immutable
class Chart extends MainScreen {
  final AsyncMemoizer memCache;

  Chart(this.memCache);

  @override
  String getNameScreen() {
    return "ChartScreen";
  }

  @override
  _HorizantalGradientState createState() => _HorizantalGradientState();
}

/// State class of horizontal gradient.
class _HorizantalGradientState extends MainScreenState<ChartNotifier> {
  _HorizantalGradientState();
  int index = DateTime.now().month < 5
      ? 0
      : DateTime.now().month < 9
          ? 1
          : 2;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    provider.getAttendanceChart(context, (widget as Chart).memCache);
    return Column(
      children: [
        Container(
          height: 300,
          child: Padding(
            padding: EdgeInsets.only(right: 15, left: 10, bottom: 20),
            child: Selector<ChartNotifier, bool>(
              builder: (context, isLoading, child) {
                if (isLoading) {
                  return Container(
                    color: Colors.grey[300].withOpacity(0.5),
                    width: double.infinity,
                    height: double.infinity,
                    child: new Padding(
                        padding: const EdgeInsets.all(5.0),
                        child:
                            new Center(child: new CircularProgressIndicator())),
                  );
                } else {
                  return SwipeDetector(
                    child: getDefaultLineChart(provider.chartData),
                    onSwipeLeft: () {
                      setState(() {
                        if (index < 2) {
                          index++;
                        }
                      });
                    },
                    onSwipeRight: () {
                      setState(() {
                        if (index > 0) {
                          index--;
                        }
                      });
                    },
                  );
                }
              },
              selector: (cx, provider) => provider.isLoading,
            ),
          ),
        ),
      ],
    );
  }

  SfCartesianChart getDefaultLineChart(List<ChartData> data) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      legend: Legend(isVisible: false),
      primaryXAxis: CategoryAxis(
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        labelPlacement: LabelPlacement.onTicks,
        majorGridLines: MajorGridLines(width: 0),
      ),
      tooltipBehavior: TooltipBehavior(enable: true),
      primaryYAxis: NumericAxis(
        isVisible: true,
        labelFormat: '{value}h',
        labelStyle: TextStyle(fontSize: 0),
        axisLine: AxisLine(width: 0),
        majorGridLines: MajorGridLines(width: 1),
        majorTickLines: MajorTickLines(size: 0),
      ),
      series: <AreaSeries<ChartData, String>>[
        AreaSeries<ChartData, String>(
          animationDuration: 2000,
          color: context.bgCard,
          borderColor: Colors.blueAccent[100],
          borderWidth: 2,
          enableTooltip: true,
          dataSource: data,
          name: appLocalizations.workingHours,
          xValueMapper: (ChartData sales, _) => sales.x,
          yValueMapper: (ChartData sales, _) => sales.y,
          markerSettings: MarkerSettings(
            isVisible: true,
            borderWidth: 2,
            color: Colors.blueAccent,
          ),
          dataLabelSettings: DataLabelSettings(
            color: Colors.blueAccent,
            isVisible: true,
            useSeriesColor: true,
            labelAlignment: ChartDataLabelAlignment.top,
          ),
        )
      ],
    );
  }
}
