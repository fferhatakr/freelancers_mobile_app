import 'package:flutter/material.dart';

class freelancerDashboard extends StatelessWidget {
  const freelancerDashboard({Key? key}) : super(key: key);
  final String _title = 'Good morning, Ferhat!';
  final String _miniTittle = 'Lets get things done today.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_title, style: TextStyle(fontWeight: FontWeight.w700)),
            Text(_miniTittle, style: TextStyle(fontSize: 15)),
          ],
        ),
        centerTitle: false,

        actions: [
          Container(
            padding: EdgeInsets.only(right: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(224, 224, 224, 1),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Card(
              color: Color(0xFFF2F2FC),
              elevation: 10,
              margin: cardsFeatures.cardMargin,
              child: SizedBox(
                height: 130,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Todays Progress',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 117, 9, 206),
                          fontWeight: fontWeight.fontStyle,
                        ),
                      ),
                      Text(
                        '4/5',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Container(
                            height: 10,
                            width: 300,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 198, 112, 255),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(Icons.stars),
                          Text('You are doing great! Keep it up.'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text('Overview', style: styleText.genHeading),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text('See all', style: TextStyle(fontSize: 15)),
                  ),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: cardsFeatures.cardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: cardsFeatures.height,
                      width: cardsFeatures.widht,

                      child: Column(
                        spacing: styleText.spacing,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.attach_money),
                          Text('Earnings', style: styleText.textStyle),
                          Text('₺12.450', style: styleText.intText),
                          Text(
                            '%12 this month',
                            style: styleText.wemonyearText,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  color: cardsFeatures.cardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: cardsFeatures.height,
                      width: cardsFeatures.widht,
                      child: Column(
                        spacing: styleText.spacing,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.work),
                          Text('Project', style: styleText.textStyle),
                          Text('7', style: styleText.intText),
                          Text('%2 this month', style: styleText.wemonyearText),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  color: cardsFeatures.cardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: cardsFeatures.height,
                      width: cardsFeatures.widht,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: styleText.spacing,
                        children: [
                          Icon(Icons.watch),
                          Text('Hours Tracked', style: styleText.textStyle),
                          Text('₺12.450', style: styleText.intText),
                          Text(
                            '15% this month',
                            style: styleText.wemonyearText,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  color: cardsFeatures.cardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: cardsFeatures.height,
                      width: cardsFeatures.widht,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: styleText.spacing,
                        children: [
                          Icon(Icons.watch),
                          Text('Hours Tracked', style: styleText.textStyle),
                          Text('₺12.450', style: styleText.intText),
                          Text(
                            '15% this month',
                            style: styleText.wemonyearText,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text('Active Project', style: styleText.genHeading),
                  Spacer(),
                  TextButton(onPressed: () {}, child: Text('See all')),
                ],
              ),
            ),
            Card(
              color: cardsFeatures.cardColor,
              child: Padding(
                padding: cardsFeatures.cardMargin,
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: const Color.fromARGB(255, 188, 255, 206),
                        ),
                        child: Icon(Icons.language),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'E-Commerce Website',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Design & Development',
                                  style: TextStyle(fontSize: 10),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Container(
                                    width: 200,
                                    height: 3,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        188,
                                        255,
                                        206,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              color: cardsFeatures.cardColor,
              child: Padding(
                padding: cardsFeatures.cardMargin,
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: const Color.fromARGB(255, 197, 152, 255),
                        ),
                        child: Icon(Icons.phone_iphone_rounded),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Mobile App UI/UX',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'UI/UX Design',
                                  style: TextStyle(fontSize: 10),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Container(
                                    width: 150,
                                    height: 3,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        197,
                                        152,
                                        255,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              color: cardsFeatures.cardColor,
              child: Padding(
                padding: cardsFeatures.cardMargin,
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: const Color.fromARGB(255, 255, 176, 111),
                        ),
                        child: Icon(Icons.stacked_bar_chart_sharp),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Admin Dashboard',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Development',
                                  style: TextStyle(fontSize: 10),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Container(
                                    width: 100,
                                    height: 3,
                                    decoration: BoxDecoration(
                                      color: Colors.amber[700],
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        fixedColor: const Color.fromARGB(255, 64, 198, 255),
        backgroundColor: Colors.white,
        elevation: 5,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_max), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Project'),
          BottomNavigationBarItem(icon: Icon(Icons.task_sharp), label: 'Tasks'),
        ],
      ),
    );
  }
}

class cardsFeatures {
  static Color cardColor = Colors.white;
  static double height = 100;
  static double widht = 75;
  static const cardMargin = EdgeInsets.all(10);
}

class fontWeight {
  static FontWeight fontStyle = FontWeight.w700;
}

class miniCardColors {
  static Color miniColor = Colors.blueGrey;
}

class styleText {
  static const textStyle = TextStyle(fontSize: 10);
  static const intText = TextStyle(fontSize: 15, fontWeight: FontWeight.w700);
  static const wemonyearText = TextStyle(fontSize: 9);
  static double spacing = 7;
  static const genHeading = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
}
