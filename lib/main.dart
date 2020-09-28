import 'package:Appcilious/custom_clipper.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isConnected = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBgColor,
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: [
              upperCurvedContainer(context),
              circularButtonWidget(context, screenWidth),
            ],
          ),
          SizedBox(
            height: screenWidth * 0.4,
          ),
          ConnectedStatusText(connectionStatus: isConnected),
          SizedBox(
            height: 20,
          ),
          locationCard(
              'Random Location', Colors.transparent, kIndiaFlagUrl, 'India'),
          SizedBox(
            height: 20,
          ),
          locationCard(
              'Select Location', Colors.indigo[100], kChinaFlagUrl, 'China'),
        ],
      ),
    );
  }
}

Widget upperCurvedContainer(BuildContext context) {
  return ClipPath(
    clipper: MyCustomClipper(),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 36),
      height: 320,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(gradient: kCurveGradient),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _topRow(),
          Text(
            'Satellite VPN',
            style: kVpnStyle,
          ),
          _bottomRow(),
        ],
      ),
    ),
  );
}

Widget _topRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        height: 50,
        decoration: BoxDecoration(
          color: kBgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              Icons.vpn_key,
              color: Colors.white,
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              'Go Premium',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: kBgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Icon(
            Icons.settings,
            size: 26,
            color: Colors.white,
          ),
        ),
      )
    ],
  );
}

Widget _bottomRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Upload\n546 kB\'s',
        style: kSpeedStyle,
      ),
      Text(
        'Download\n32 mb/s',
        style: kSpeedStyle,
      ),
    ],
  );
}

class ConnectedStatusText extends StatelessWidget {
  final bool connectionStatus;
  ConnectedStatusText({this.connectionStatus});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'Status :',
          style: kConnectedStyle,
          children: [
            TextSpan(text: ' connected\n', style: kConnectedGreenStyle),
            TextSpan(text: '00:22:45', style: kConnectedSubtitleStyle),
          ],
        ),
      ),
    );
  }
}

Widget circularButtonWidget(BuildContext context, width) {
  return Positioned(
    bottom: -width * 0.35,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: width * 0.51,
          width: width * 0.51,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: kCurveGradient,
          ),
          child: Center(
            child: Container(
              height: width * 0.4,
              width: width * 0.4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kBgColor,
              ),
              child: Center(
                child: Container(
                  height: width * 0.3,
                  width: width * 0.3,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: kGreenGradient,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF00D58D).withOpacity(0.2),
                        spreadRadius: 15,
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      Icons.wifi_lock,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );
}

Widget locationCard(title, cardBgColor, flag, country) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: kLocationTitleStyle,
        ),
        SizedBox(
          height: 14,
        ),
        Container(
          height: 80,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: cardBgColor,
            border: Border.all(
                color: Color(0xFF9BB1BD), style: BorderStyle.solid, width: 0.5),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 20,
                backgroundImage: NetworkImage(flag),
              ),
              title: Text(
                country,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              trailing: Icon(
                Icons.refresh,
                size: 28,
                color: Colors.white70,
              ),
            ),
          ),
        )
      ],
    ),
  );
}
