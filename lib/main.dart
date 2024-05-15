// import 'package:flutter/material.dart';
// import 'package:flutter_investment_control/services/asset_provider.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:provider/provider.dart';
// import 'core/app_widget.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   MobileAds.instance.initialize();

//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => AssetProvider(),
//       child: const AppWidget(),
//     ),
//   );
// }


import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Investment Bar Chart',
      theme: ThemeData(
        primaryColor: Color(0xFF2F3336),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: InvestmentBarChartExample(),
    );
  }
}

class InvestmentBarChartExample extends StatefulWidget {
  @override
  _InvestmentBarChartExampleState createState() => _InvestmentBarChartExampleState();
}

class _InvestmentBarChartExampleState extends State<InvestmentBarChartExample> {
  late List<_InvestmentData> data;

  @override
  void initState() {
    super.initState();
    data = [
      _InvestmentData('Cryptocurrency', 100),
      _InvestmentData('Bonds', 200),
      _InvestmentData('Real Estate', 150),
      _InvestmentData('Stocks', 250),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(labelFormat: '{value}%'),
              title: ChartTitle(text: 'Investment Analysis'),
              tooltipBehavior: TooltipBehavior(enable: true, header: ''),
              series: <CartesianSeries<dynamic, String>>[
                ColumnSeries<_InvestmentData, String>(
                  dataSource: data,
                  xValueMapper: (_InvestmentData investment, _) => investment.label,
                  yValueMapper: (_InvestmentData investment, _) => investment.amount,
                  dataLabelSettings: DataLabelSettings(isVisible: true, labelAlignment: ChartDataLabelAlignment.middle),
                  color: Color.fromRGBO(47, 51, 54, 1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _InvestmentData {
  _InvestmentData(this.label, this.amount);

  final String label;
  final double amount;
}
