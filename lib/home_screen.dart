import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'q_tile.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:holding_gesture/holding_gesture.dart';
import 'article_tile.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'q_tile_pic.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> listOfCountries = [
    // Sort this alphabetically or by most common country? (use John Hopkins site for info on country names for API reference)
    'Canada',
    'US',
    'Colombia',
    'Mexico',
    'China',
    'Italy',
    'Iran',
    'Brazil',
    'United Kingdom',
    'Thailand',
    'Germany',
    'Turkey',
    'Australia',
    'Spain',
    'France',
    'Peru',
    'Greece',
    'Argentina',
    'Egypt',
    'Saudi Arabia',
    'Congo (Brazzaville)',
    'Sudan',
    'Poland',
    'Ukraine',
    'Russia',
    'India',
    'Iraq',
    'Portugal',
    'Cuba',
    'Japan',
    'Korea, South',
    'Mongolia',
    'Pakistan',
    'Indonesia',
    'Belgium',
    'Sweden',
    'Ecuador',
    'Romania',
    'Luxembourg',
    'Singapore',
    'South Africa',
    'Moldova',
    'Iceland',
    'Costa Rica',
  ];

  launchURL() async {
    var launchUrl =
        'https://www.cdc.gov/coronavirus/2019-ncov/if-you-are-sick/steps-when-sick.html';
    if (await canLaunch(launchUrl)) {
      await launch(launchUrl);
    } else {
      throw 'Could not launch $launchUrl';
    }
  }

  int listCountryNum = 0;
  int listDataTypesNum = 0;

  List<String> listOfTypesOfData = [
    'Confirmed Cases',
    'Deaths',
    'Recovered Cases',
  ];

  List<double> data = [0, 1, 0];

  List<double> data1 = [0, 1];
  List<double> data2 = [0, 1];
  List<double> data3 = [0, 1];

  String country = 'Canada';
  String typeOfData = 'confirmed';
  String date;
  int confirmed;
  int deaths;
  int recovered;

  var info;
  var counter = 0;

  List<double> infoConfirmed = [];
  List<double> infoDeaths = [];
  List<double> infoCases = [];

  var lastTest1 = 0;
  var lastTest2 = 0;
  var lastTest3 = 0;

  Color dataPointsCol = Colors.transparent;
  String dp = 'DPs Off';

  http.Response response;

  http.Response newsResponse;

  String news1a = '';
  String news1b = '';
  String news1c = '';
  String news2a = '';
  String news2b = '';
  String news2c = '';
  String news3a = '';
  String news3b = '';
  String news3c = '';
  String news4a = '';
  String news4b = '';
  String news4c = '';
  String news5a = '';
  String news5b = '';
  String news5c = '';
  String news6a = '';
  String news6b = '';
  String news6c = '';
  String news7a = '';
  String news7b = '';
  String news7c = '';
  String news8a = '';
  String news8b = '';
  String news8c = '';
  String news9a = '';
  String news9b = '';
  String news9c = '';
  String news10a = '';
  String news10b = '';
  String news10c = '';

  getDeviceInfoGraph() {
    setState(() {
      String currentHour = DateTime.now().hour.toString();
      String currentMinute = DateTime.now().minute.toString();
      if (int.parse(currentHour) < 10) {
        currentHour == '0' ? currentHour = '00' : currentHour = currentHour;
        currentHour == '1' ? currentHour = '01' : currentHour = currentHour;
        currentHour == '2' ? currentHour = '02' : currentHour = currentHour;
        currentHour == '3' ? currentHour = '03' : currentHour = currentHour;
        currentHour == '4' ? currentHour = '04' : currentHour = currentHour;
        currentHour == '5' ? currentHour = '05' : currentHour = currentHour;
        currentHour == '6' ? currentHour = '06' : currentHour = currentHour;
        currentHour == '7' ? currentHour = '07' : currentHour = currentHour;
        currentHour == '8' ? currentHour = '08' : currentHour = currentHour;
        currentHour == '9' ? currentHour = '09' : currentHour = currentHour;
      }
      if (int.parse(currentMinute) < 10) {
        currentMinute == '0' ? currentMinute = '00' : currentMinute = currentMinute;
        currentMinute == '1' ? currentMinute = '01' : currentMinute = currentMinute;
        currentMinute == '2' ? currentMinute = '02' : currentMinute = currentMinute;
        currentMinute == '3' ? currentMinute = '03' : currentMinute = currentMinute;
        currentMinute == '4' ? currentMinute = '04' : currentMinute = currentMinute;
        currentMinute == '5' ? currentMinute = '05' : currentMinute = currentMinute;
        currentMinute == '6' ? currentMinute = '06' : currentMinute = currentMinute;
        currentMinute == '7' ? currentMinute = '07' : currentMinute = currentMinute;
        currentMinute == '8' ? currentMinute = '08' : currentMinute = currentMinute;
        currentMinute == '9' ? currentMinute = '09' : currentMinute = currentMinute;
      }
      timeNowGraph = '$currentHour:$currentMinute';
    });
  }

  getDeviceInfoDate() {
    setState(() {
      String currentHour = DateTime.now().hour.toString();
      String currentMinute = DateTime.now().minute.toString();
      if (int.parse(currentHour) < 10) {
        currentHour == '0' ? currentHour = '00' : currentHour = currentHour;
        currentHour == '1' ? currentHour = '01' : currentHour = currentHour;
        currentHour == '2' ? currentHour = '02' : currentHour = currentHour;
        currentHour == '3' ? currentHour = '03' : currentHour = currentHour;
        currentHour == '4' ? currentHour = '04' : currentHour = currentHour;
        currentHour == '5' ? currentHour = '05' : currentHour = currentHour;
        currentHour == '6' ? currentHour = '06' : currentHour = currentHour;
        currentHour == '7' ? currentHour = '07' : currentHour = currentHour;
        currentHour == '8' ? currentHour = '08' : currentHour = currentHour;
        currentHour == '9' ? currentHour = '09' : currentHour = currentHour;
      }
      if (int.parse(currentMinute) < 10) {
        currentMinute == '0' ? currentMinute = '00' : currentMinute = currentMinute;
        currentMinute == '1' ? currentMinute = '01' : currentMinute = currentMinute;
        currentMinute == '2' ? currentMinute = '02' : currentMinute = currentMinute;
        currentMinute == '3' ? currentMinute = '03' : currentMinute = currentMinute;
        currentMinute == '4' ? currentMinute = '04' : currentMinute = currentMinute;
        currentMinute == '5' ? currentMinute = '05' : currentMinute = currentMinute;
        currentMinute == '6' ? currentMinute = '06' : currentMinute = currentMinute;
        currentMinute == '7' ? currentMinute = '07' : currentMinute = currentMinute;
        currentMinute == '8' ? currentMinute = '08' : currentMinute = currentMinute;
        currentMinute == '9' ? currentMinute = '09' : currentMinute = currentMinute;
      }
      timeNowDate = '$currentHour:$currentMinute';
    });
  }

  String timeNowDate = '';
  String timeNowGraph = '';

  void getNewsData() async {
    newsResponse = await http.get(
        'https://newsapi.org/v2/top-headlines?country=us&category=health&apiKey=0b4d1c846ba3486096a81b426d6558b8');
    newsData = newsResponse.body;
    decodedData = jsonDecode(newsData);
    setState(() {
      // wasn't previously here... setState need to be here? Messing anything up?
      news1a = decodedData['articles'][0]['title'];
      news1b = decodedData['articles'][0]['description'];
      news1c = decodedData['articles'][0]['url'];
      news2a = decodedData['articles'][1]['title'];
      news2b = decodedData['articles'][1]['description'];
      news2c = decodedData['articles'][1]['url'];
      news3a = decodedData['articles'][2]['title'];
      news3b = decodedData['articles'][2]['description'];
      news3c = decodedData['articles'][2]['url'];
      news4a = decodedData['articles'][3]['title'];
      news4b = decodedData['articles'][3]['description'];
      news4c = decodedData['articles'][3]['url'];
      news5a = decodedData['articles'][4]['title'];
      news5b = decodedData['articles'][4]['description'];
      news5c = decodedData['articles'][4]['url'];
      news6a = decodedData['articles'][5]['title'];
      news6b = decodedData['articles'][5]['description'];
      news6c = decodedData['articles'][5]['url'];
      news7a = decodedData['articles'][6]['title'];
      news7b = decodedData['articles'][6]['description'];
      news7c = decodedData['articles'][6]['url'];
      news8a = decodedData['articles'][7]['title'];
      news8b = decodedData['articles'][7]['description'];
      news8c = decodedData['articles'][7]['url'];
      news9a = decodedData['articles'][8]['title'];
      news9b = decodedData['articles'][8]['description'];
      news9c = decodedData['articles'][8]['url'];
      news10a = decodedData['articles'][9]['title'];
      news10b = decodedData['articles'][9]['description'];
      news10c = decodedData['articles'][9]['url'];
    });
    print('[mt] Data Received! [from url distribution]');
  }

  @override
  void initState() {
    super.initState();
    waitLoad();
    getDeviceInfoGraph();
    getDeviceInfoDate();
    getData();
    getNewsData();
  }

  void waitLoad() {
//    sleep(const Duration(seconds: 1));
    getNewsData();
  }

  String newsData;
  var decodedNewsData;

  String jData;
  var decodedData;

  void getData() async {
    counter = 0;
    // past location of data.clear();
    try {
      response = await http.get('https://pomber.github.io/covid19/timeseries.json');
    } catch (er) {
      print('caught the error! finalllllly!');
      showDialog(
        context: context,
        builder: (_b) => Center(
          child: SingleChildScrollView(
            child: AlertDialog(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  20.0,
                ),
              ),
              backgroundColor: Colors.indigoAccent,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 25),
                    child: Center(
                      child: Text(
                        'No Connection!',
                        textScaleFactor: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontFamily: 'Baloo', fontSize: 35, color: Colors.white),
                      ),
                    ),
                  ),
                  FlatButton(
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Ok',
                      textScaleFactor: 1,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    if (response.statusCode == 200) {
      jData = response.body;
      decodedData = jsonDecode(jData);
      data.clear();
      data1.clear();
      data2.clear();
      data3.clear();
      do {
        setState(() {
          data.add(decodedData['$country'][counter]['$typeOfData'].toDouble());

          data1.add(decodedData['$country'][counter]['confirmed'].toDouble());
          data2.add(decodedData['$country'][counter]['deaths'].toDouble());
          data3.add(decodedData['$country'][counter]['recovered'].toDouble());
          lastTest1 = data1.length - 1;
          lastTest2 = data2.length - 1;
          lastTest3 = data3.length - 1;
        });
        counter++;
      } while (counter != null);
    } else {
//      print(response.statusCode);
      print('matt bug - bad statusCode (not a good \'ol 200');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            tileMode: TileMode.clamp,
            colors: [Colors.lightBlueAccent, Colors.deepPurpleAccent],
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    tileMode: TileMode.clamp,
                    colors: [Colors.lightBlueAccent, Colors.deepPurpleAccent]),
                borderRadius: null,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: AutoSizeText(
                      'The Invisible Enemy',
                      textScaleFactor: 1,
                      maxLines: 1,
                      maxFontSize: 30,
                      style: TextStyle(
                        fontFamily: 'Baloo',
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TypewriterAnimatedTextKit(
                      text: ['COVID-19'],
                      textStyle: TextStyle(
                        fontFamily: 'Baloo',
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: ClipRRect(
                // POT ERROR (MediaQuery.of(context).size.height,)
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: AutoSizeText(
                                'What Is A Virus?',
                                textScaleFactor: 1,
                                maxFontSize: 35,
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Baloo', fontSize: 35, color: Colors.black),
                              ),
                            ),
                          ),
                          Container(
                            height: 185,
                            width: MediaQuery.of(context).size.width,
                            child: ListView(
                              physics: ClampingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                QTile(
                                    tileTitle: 'Dictionary Definition',
                                    alertTitle: 'Dictionary Definition',
                                    alertMessage:
                                        'An infective agent that typically consists of a nucleic acid molecule in a protein coat, is too small to be seen by light microscopy, and is able to multiply only within the living cells of a host.'),
                                QTile(
                                    tileTitle: 'Origin Of The Word',
                                    alertTitle: 'Origin Of The Word',
                                    alertMessage:
                                        'The word \'virus\' was derived from the Latin word meaning slimy liquid or poison.'),
                                QTile(
                                    tileTitle: 'Bacteria vs. Viruses',
                                    alertTitle: 'Bacteria vs. Viruses',
                                    alertMessage:
                                        'These two are very much two different things. The first notable difference is that all bacteria is much larger than any virus. Next, most bacteria are harmless (the harmful ones are called \'pathogenic bacteria\') while most viruses are quite harmful. Bacteria are also alive while viruses may or may not be depending on who you ask. Finally, bacteria can survive alone while viruses require a host to \'survive\'.'),
                                QTile(
                                    tileTitle: 'Is A Virus Dead Or Alive?',
                                    alertTitle: 'Is A Virus Dead Or Alive?',
                                    alertMessage:
                                        'Although often debated, viruses fufil the requirments for being alive because they are a coherent collection of genes that replicate within their specific niche.'),
                                QTile(
                                    tileTitle: 'How Does One Get Infected?',
                                    alertTitle: 'How Does One Get Infected?',
                                    alertMessage:
                                        'Many people get viruses from insect bites, swallowing/inhaling them or through sexual contact.'),
                                QTile(
                                    tileTitle: 'What Does An Infection Look Like?',
                                    alertTitle: 'What Does An Infection Look Like?',
                                    alertMessage:
                                        'Viral infections typically appear in the form of nose, throat and upper airway ailments.'),
                                QTile(
                                    tileTitle: 'Do Antiviral Drugs Help?',
                                    alertTitle: 'Do Antiviral Drugs Help?',
                                    alertMessage:
                                        'Antiviral drugs often strengthen the immune response to the infection or interfere with the reproduction of said virus.'),
                                QTile(
                                    tileTitle: 'General Virus Characteristics',
                                    alertTitle: 'General Virus Characteristics',
                                    alertMessage:
                                        'Viruses are non-cellular, don\'t respond to stimuli, don\'t respire, do not grow, contain DNA/RNA/both, are parasitic, contain small amounts of enzymes, contain a protein coat around DNA/RNA and can be stored inert (with reproducing) for long periods of time.'),
                                QTile(
                                    tileTitle: 'How Big Are Viruses?',
                                    alertTitle: 'How Big Are Viruses?',
                                    alertMessage:
                                        'Viruses are between 20-400ish nanometers in diameter.'),
                                QTile(
                                    tileTitle: 'What\'s A Virus Doctor Called?',
                                    alertTitle: 'What\'s A Virus Doctor Called?',
                                    alertMessage:
                                        'The study of viruses is known as virology. The scientists who study viruses are called virologists.'),
                                QTile(
                                    tileTitle: 'Examples Of Other Well Known Viruses',
                                    alertTitle: 'Examples Of Well Known Viruses',
                                    alertMessage:
                                        'Some examples of other well known viruses include: influenza, ebola, human pappiloma virus and noravirus.'),
                                QTile(
                                    tileTitle: 'The Genetic Formation Of A Virus',
                                    alertTitle: 'The Genetic Formation Of A Virus',
                                    alertMessage:
                                        'The genetic build of a virus can be either RNA or DNA; single or double-stranded; and with one or more molecules.'),
                                QTile(
                                    tileTitle: 'What Can Viruses Infect?',
                                    alertTitle: 'What Can Viruses Infect?',
                                    alertMessage:
                                        'Viruses can infect a lot things, including: animals, plants, protozoa, fungi, bacteria and archaea - they can also infect other viruses!'),
                                QTile(
                                    tileTitle: 'How Do I Stay Safe?',
                                    alertTitle: 'How Do I Stay Safe?',
                                    alertMessage:
                                        'Being hygienic is the best way to stay safe. Some examples of good hygiene include: clean waste disposal, drinking clean water, having efficient sanitation facilities and good personal hygiene. Also, immunization via vaccine can prove to sometimes be helpful.'),
                                QTile(
                                    tileTitle: 'Virus Surface Life',
                                    alertTitle: 'Virus Surface Life',
                                    alertMessage:
                                        'The length of time that viruses can survive on a surface varies greatly between different varieties of virus. Some break apart within a few minutes while others can last weeks.'),
                              ],
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: AutoSizeText(
                                'How Do Viruses Spread Within Someone?',
                                textScaleFactor: 1,
                                maxFontSize: 35,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Baloo', fontSize: 35, color: Colors.black),
                              ),
                            ),
                          ),
//                          Center(
//                              child: IconButton(
//                                  icon: Icon(Icons.info),
//                                  onPressed: () {
//                                    // alert dialog with diagram
//                                    showDialog(
//                                      context: context,
//                                      builder: (_) => Center(
//                                        child: SingleChildScrollView(
//                                          child: AlertDialog(
//                                            elevation: 8,
//                                            shape: RoundedRectangleBorder(
//                                              borderRadius:
//                                                  BorderRadius.circular(
//                                                20.0,
//                                              ),
//                                            ),
//                                            backgroundColor:
//                                                Colors.indigoAccent,
//                                            title: Column(
//                                              crossAxisAlignment:
//                                                  CrossAxisAlignment.center,
//                                              children: <Widget>[
//                                                Padding(
//                                                  padding: EdgeInsets.only(bottom: 5),
//                                                  child: Center(
//                                                    child: Text(
//                                                      'Infectious Cycle',
//                                                      textAlign: TextAlign.center,
//                                                      style: TextStyle(
//                                                          fontFamily: 'Baloo',
//                                                          fontSize: 35,
//                                                          color: Colors.white),
//                                                    ),
//                                                  ),
//                                                ),
//                                                ClipRRect(
//                                                  borderRadius: BorderRadius.circular(8.0),
//                                                  child: Image.asset(
//                                                      'images/cycle1.1'),
//                                                ),
//                                                Padding(
//                                                  padding: EdgeInsets.only(top: 20),
//                                                  child: FlatButton(
//                                                    color: Colors.white,
//                                                    onPressed: () {
//                                                      Navigator.pop(context);
//                                                    },
//                                                    child: Text('Ok'),
//                                                    shape: RoundedRectangleBorder(
//                                                      borderRadius:
//                                                          BorderRadius.circular(
//                                                              18.0),
//                                                    ),
//                                                  ),
//                                                ),
//                                              ],
//                                            ),
//                                          ),
//                                        ),
//                                      ),
//                                    );
//                                  })),
                          Container(
                            height: 185,
                            width: MediaQuery.of(context).size.width,
                            child: ListView(
                              physics: ClampingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                QTile(
                                  tileTitle: 'How Do Viruses Reproduce?',
                                  alertTitle: 'How Do Viruses Reproduce?',
                                  alertMessage:
                                      'Viruses first attach to the host cell membrane. They attach by matching their proteins to that of the ones on the surface of said host. This is called viral specificity. Some of these viruses have a covering that allows them to \'pretend\' to be the host cell to avoid detection by the hosts immune system (wolf in sheeps clothing). Next, the virus forcefully inserts its genetic material (RNA or DNA) into the cell it\'s latched onto; sometimes the whole viral particle goes into the cell. Then the virus either follows the \'Lytic Cycle\' or the \'Lysogenic Cycle\'.',
                                ),
                                QPicTile(
                                  tileTitle: 'Lytic Cycle',
                                  alertTitle: 'Lytic Cycle',
                                  alertMessage1: '*COVID-19 utilizes the Lytic Cycle.',
                                  picName: 'images/realCycle2.png',
                                  alertMessage2:
                                      'The viral DNA/RNA takes over the infected host cell. It then forces the cell to make new viral components (DNA and proteins). These components are assembled inside the host until eventually the host bursts open, dying, releasing new virus particles everywhere. These new viruses then attach to new healthy cells starting the whole process over again. The Lytic Cycle takes place quickly (average of 30 minutes). Viruses in this cycle are called \'Virulent\' (infectious). Our immune system fighting a virulent virus (such as the common cold) usually causes fever, sneezing, coughing etc.',
                                ),
                                QPicTile(
                                  tileTitle: 'Lysogenic Cycle',
                                  alertTitle: 'Lysogenic Cycle',
                                  alertMessage1:
                                      '*Viruses in the Lysogenic Cycle can enter the Lytic Cycle if triggered.',
                                  picName: 'images/realCycle1.png',
                                  alertMessage2:
                                      'The viral DNA becomes a part of the host cells DNA. It acts as another set of genes on the invaded cells chromosome. Upon completing this stage the intruder DNA is now called a prophage. Unlike the Lytic Cycle, the virus doesn\'t actually kill the host cell. It remains in the cell even when the cell divides, which is when it becomes part of the daughter cells. Through this method, the prophage becomes a part of millions of daughter cells as it may remain in the host cells DNA for many generations. Viruses in this cycle are now called \'Temperate Phages\'. Two common examples of temperate viruses are Herpes and HIV.',
                                ),
                                QPicTile(
                                  tileTitle: 'Common Phage Structure',
                                  alertTitle: 'Common Phage Structure',
                                  alertMessage1:
                                      '*This is a general phage structure, not all phages look and act like this. Some are very different.',
                                  picName: 'images/phage1.png',
                                  alertMessage2:
                                      'In order for the reproduction cycle to begin the phage must first enter the host cell. These bind (using their tail fibers) to very specific receptors on the surface of the cell. They then create a hole of sorts which is coordinated by the base plate. Next, a tube is shot out of the sheath which punctures a hole in the cell membrane. It is through this hole that they insert their genetic material (RNA or DNA). After this, they then can hijack the cell\'s machinery and use it for their own replication through the Lytic Cycle or alternatively, they may become dormant and begin the Lysogenic Cycle.',
                                ),
                                QTile(
                                  tileTitle: 'Can Viruses Survive Alone?',
                                  alertTitle: 'Can Viruses Survive Alone?',
                                  alertMessage:
                                      'Viruses actually cannot survive independently. They must have a home (or a host) organism in order for them to reproduce and survive (they alone don\'t have sufficient machinery). Also, this is another reason why them being \'alive\' is hotly debated.',
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: AutoSizeText(
                              'How Do We Defend Against Viruses?',
                              textScaleFactor: 1,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              maxFontSize: 35,
                              style:
                                  TextStyle(fontFamily: 'Baloo', fontSize: 35, color: Colors.black),
                            ),
                          ),
                          Container(
                            height: 185,
                            width: MediaQuery.of(context).size.width,
                            child: ListView(
                              physics: ClampingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                QTile(
                                  tileTitle: 'Our Levels Of Defense',
                                  alertTitle: 'Our Levels Of Defense',
                                  alertMessage:
                                      'Our bodies have 3 natural lines of defense against viruses: physical/chemical barriers, non-specific resistence and finally specific resistence. We can also use our unnatural defense - being clean and hygenic.',
                                ),
                                QTile(
                                  tileTitle: 'First Line Of Defense',
                                  alertTitle: 'First Line Of Defense',
                                  alertMessage:
                                      'This is the physical/chemical barrier level. In this level of defense our body utilizses our skin, oil/sweat, hair, bacteria (although having a bad connotation, they do help defend us), ear wax, tears/saliva, mucus, cilia (lining of the respiratory tract) and gastric juice (acidic stomic acid) to help keep out pathogens. This layer is usually quite succesful in trapping almost every harmful bug that wants to enter our bodies.',
                                ),
                                QTile(
                                  tileTitle: 'Second Line Of Defense',
                                  alertTitle: 'Second Line Of Defense',
                                  alertMessage:
                                      'This is the non-specific resistence level. Upon getting through the first level of defense the pathogen enter the body and the body utilizes this defense tactic: white blood cells called macrophages come alive, these macrophages destroy any foreign substances in the body by engulfing or \'eating\' them. This process is called phagocytosis.',
                                ),
                                QTile(
                                  tileTitle: 'Third Line Of Defense',
                                  alertTitle: 'Third Line Of Defense',
                                  alertMessage:
                                      'This is the specific resistence level. Upon getting through the first and second line of defense the pathogen comes to the final frontier, a type of white blood cell called lymphocytes that make antibodies that attach to the outer layer of the pathogens. These antibodies combine with the invaders, rendering them helpless. They also place a red target on them that marks them for destruction by another type of white blood cell.',
                                ),
                                QTile(
                                  tileTitle: 'Unnatural Line Of Defense',
                                  alertTitle: 'Unnatural Line Of Defense',
                                  alertMessage:
                                      'This line of defense is us being hygenic and actively taking measure to prevent the spread of disease. Some techniques include washing your hands, avoid touching susceptible places (such as eyes, mouth or nose), avoid close contact with others (social distancing), cleaning frequently used surfaces regularly, getting vaccinated (unless you have real reasons not to be) and finally adopting a healthy lifestyle (getting enough sleep, good diet and excercising regularly).',
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: Center(
                              child: FlatButton(
                                color: Colors.indigoAccent,
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) => Center(
                                      child: SingleChildScrollView(
                                        child: AlertDialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              20.0,
                                            ),
                                          ),
                                          backgroundColor: Colors.indigoAccent,
                                          title: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Center(
                                                child: Text(
                                                  'Common Symptoms',
                                                  textScaleFactor: 1,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontFamily: 'Baloo',
                                                      fontSize: 35,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 30),
                                                child: Container(
                                                  width: MediaQuery.of(context).size.width,
                                                  height: 2,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 10, bottom: 1),
                                                child: Text(
                                                  'Fever/cough',
                                                  textScaleFactor: 1,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontFamily: 'Baloo',
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 10, bottom: 1),
                                                child: Text(
                                                  'Shortness of breath/trouble breathing',
                                                  textScaleFactor: 1,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontFamily: 'Baloo',
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 10, bottom: 1),
                                                child: Text(
                                                  'Pain/pressure in chest',
                                                  textScaleFactor: 1,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontFamily: 'Baloo',
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 10, bottom: 1),
                                                child: Text(
                                                  'Confusion/fainting/loss of consciousness',
                                                  textScaleFactor: 1,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontFamily: 'Baloo',
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 10, bottom: 1),
                                                child: Text(
                                                  'Smell deficiency',
                                                  textScaleFactor: 1,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontFamily: 'Baloo',
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 10, bottom: 1),
                                                child: Text(
                                                  'Pneumonia in both lungs',
                                                  textScaleFactor: 1,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontFamily: 'Baloo',
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 10, bottom: 1),
                                                child: Text(
                                                  'Difficulty waking up',
                                                  textScaleFactor: 1,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontFamily: 'Baloo',
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 10, bottom: 1),
                                                child: Text(
                                                  'Bluish lips/face',
                                                  textScaleFactor: 1,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontFamily: 'Baloo',
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 10, bottom: 1),
                                                child: Text(
                                                  'Sore throat/muscle aches',
                                                  textScaleFactor: 1,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontFamily: 'Baloo',
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 10, bottom: 1),
                                                child: Text(
                                                  'Runny nose',
                                                  textScaleFactor: 1,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontFamily: 'Baloo',
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.only(right: 5),
                                                      child: FlatButton(
                                                        color: Colors.white,
                                                        onPressed: () {
                                                          Navigator.pop(context);
                                                        },
                                                        child: Text(
                                                          'Cancel',
                                                          textScaleFactor: 1,
                                                        ),
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(18.0),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(left: 5),
                                                      child: FlatButton(
                                                        color: Colors.white,
                                                        onPressed: () {
                                                          launchURL();
                                                        },
                                                        child: Text(
                                                          'Me!',
                                                          textScaleFactor: 1,
                                                        ),
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(18.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Think You\'ve COVID-19?',
                                  textScaleFactor: 1,
                                  style: TextStyle(color: Colors.white, fontFamily: 'Baloo'),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: AutoSizeText(
                                'COVID-19 Numbers/Graph',
                                textScaleFactor: 1,
                                maxLines: 1,
                                maxFontSize: 35,
                                style: TextStyle(
                                    fontSize: 35, fontFamily: 'Baloo', color: Colors.black),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(left: 15, right: 15, bottom: 5),
                              child: AutoSizeText(
                                'Jan 22 2020 - Current',
                                textScaleFactor: 1,
                                maxLines: 1,
                                maxFontSize: 20,
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'Baloo', color: Colors.black),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(left: 15, right: 15, bottom: 20),
                              child: AutoSizeText(
                                'Last Updated: $timeNowGraph',
                                textScaleFactor: 1,
                                maxLines: 1,
                                maxFontSize: 20,
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'Baloo', color: Colors.black),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 40, left: 40, bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                HoldDetector(
                                  onHold: () {
                                    setState(() {
                                      if (listCountryNum > 0) {
                                        listCountryNum--;
                                      } else {
                                        listCountryNum = listOfCountries.length - 1;
                                      }
                                    });
                                  },
                                  holdTimeout: Duration(milliseconds: 100),
                                  child: InkWell(
                                    child: ClipOval(
                                      child: Container(
                                        color: Colors.indigoAccent,
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.chevron_left,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              if (listCountryNum > 0) {
                                                listCountryNum--;
                                              } else {
                                                listCountryNum = listOfCountries.length - 1;
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    child: Center(
                                      child: AutoSizeText(
                                        '${listOfCountries[listCountryNum]}' ==
                                                'Congo (Brazzaville)'
                                            ? 'Congo'
                                            : '${listOfCountries[listCountryNum]}',
                                        textScaleFactor: 1,
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontFamily: 'Baloo', color: Colors.black, fontSize: 20),
                                        maxFontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                HoldDetector(
                                  onHold: () {
                                    setState(() {
                                      if (listCountryNum < listOfCountries.length - 1) {
                                        listCountryNum++;
                                      } else {
                                        listCountryNum = 0;
                                      }
                                    });
                                  },
                                  holdTimeout: Duration(milliseconds: 100),
                                  child: InkWell(
                                    child: ClipOval(
                                      child: Container(
                                        color: Colors.indigoAccent,
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.chevron_right,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              if (listCountryNum < listOfCountries.length - 1) {
                                                listCountryNum++;
                                              } else {
                                                listCountryNum = 0;
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 40, right: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                HoldDetector(
                                  onHold: () {
                                    setState(() {
                                      if (listDataTypesNum > 0) {
                                        listDataTypesNum--;
                                      } else {
                                        listDataTypesNum = listOfTypesOfData.length - 1;
                                      }
                                    });
                                  },
                                  holdTimeout: Duration(milliseconds: 150),
                                  child: InkWell(
                                    child: ClipOval(
                                      child: Container(
                                        color: Colors.indigoAccent,
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.chevron_left,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              if (listDataTypesNum > 0) {
                                                listDataTypesNum--;
                                              } else {
                                                listDataTypesNum = listOfTypesOfData.length - 1;
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    child: Center(
                                      child: AutoSizeText(
                                        '${listOfTypesOfData[listDataTypesNum]}',
                                        textScaleFactor: 1,
                                        maxLines: 1,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'Baloo', color: Colors.black, fontSize: 20),
                                        maxFontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                HoldDetector(
                                  onHold: () {
                                    setState(() {
                                      if (listDataTypesNum < listOfTypesOfData.length - 1) {
                                        listDataTypesNum++;
                                      } else {
                                        listDataTypesNum = 0;
                                      }
                                    });
                                  },
                                  holdTimeout: Duration(milliseconds: 150),
                                  child: InkWell(
                                    child: ClipOval(
                                      child: Container(
                                        color: Colors.indigoAccent,
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.chevron_right,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              if (listDataTypesNum < listOfTypesOfData.length - 1) {
                                                listDataTypesNum++;
                                              } else {
                                                listDataTypesNum = 0;
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 40, right: 40, top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                HoldDetector(
                                  onHold: () {
                                    setState(() {
                                      if (dp == 'DPs Off') {
                                        dataPointsCol = Colors.lightBlueAccent;
                                        dp = 'DPs On';
                                      } else if (dp == 'DPs On') {
                                        dataPointsCol = Colors.transparent;
                                        dp = 'DPs Off';
                                      }
                                    });
                                  },
                                  holdTimeout: Duration(milliseconds: 500),
                                  child: InkWell(
                                    child: ClipOval(
                                      child: Container(
                                        color: Colors.indigoAccent,
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.chevron_left,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              if (dp == 'DPs Off') {
                                                dataPointsCol = Colors.lightBlueAccent;
                                                dp = 'DPs On';
                                              } else if (dp == 'DPs On') {
                                                dataPointsCol = Colors.transparent;
                                                dp = 'DPs Off';
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    child: Center(
                                      child: AutoSizeText(
                                        '$dp',
                                        textAlign: TextAlign.center,
                                        textScaleFactor: 1,
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontFamily: 'Baloo', color: Colors.black, fontSize: 20),
                                        maxFontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                HoldDetector(
                                  onHold: () {
                                    setState(() {
                                      if (dp == 'DPs Off') {
                                        dataPointsCol = Colors.lightBlueAccent;
                                        dp = 'DPs On';
                                      } else if (dp == 'DPs On') {
                                        dataPointsCol = Colors.transparent;
                                        dp = 'DPs Off';
                                      }
                                    });
                                  },
                                  holdTimeout: Duration(milliseconds: 500),
                                  child: InkWell(
                                    child: ClipOval(
                                      child: Container(
                                        color: Colors.indigoAccent,
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.chevron_right,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              if (dp == 'DPs Off') {
                                                dataPointsCol = Colors.lightBlueAccent;
                                                dp = 'DPs On';
                                              } else if (dp == 'DPs On') {
                                                dataPointsCol = Colors.transparent;
                                                dp = 'DPs Off';
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Center(
                              child: FlatButton(
                                color: Colors.indigoAccent,
                                onPressed: () {
                                  getDeviceInfoGraph();
                                  if (data != null && counter > 45) {
                                    setState(() {
                                      country = listOfCountries[listCountryNum];
                                      if (listOfTypesOfData[listDataTypesNum] ==
                                          'Confirmed Cases') {
                                        typeOfData = 'confirmed';
                                      } else if (listOfTypesOfData[listDataTypesNum] == 'Deaths') {
                                        typeOfData = 'deaths';
                                      } else if (listOfTypesOfData[listDataTypesNum] ==
                                          'Recovered Cases') {
                                        typeOfData = 'recovered';
                                      }
                                    });
                                    getData();
                                  }
                                },
                                child: Text(
                                  'Sync Graph Data',
                                  textScaleFactor: 1,
                                  style: TextStyle(color: Colors.white, fontFamily: 'Baloo'),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15, bottom: 15, left: 35, right: 35),
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
//                                border: Border.all(color: Colors.indigo, width: 3),
                                  gradient: LinearGradient(
                                      tileMode: TileMode.clamp,
                                      colors: [Colors.white, Colors.white]),
                                  borderRadius: BorderRadius.only(),
                                ),
                                width: MediaQuery.of(context).size.width,
                                height: 200,
                                child: Sparkline(
                                  data: data,
                                  lineColor: Colors.indigo,
                                  fillMode: FillMode.below,
                                  fillColor: Colors.indigoAccent,
                                  pointsMode: PointsMode.all,
                                  pointSize: 5.0,
                                  pointColor: dataPointsCol,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              'Confirmed Cases:   ${data1[lastTest1].toInt() ?? '0'}',
                              textScaleFactor: 1,
                              style:
                                  TextStyle(color: Colors.black, fontFamily: 'Baloo', fontSize: 15),
                            ),
                          ),
                          Center(
                            child: Text(
                              'Deaths:   ${data2[lastTest2].toInt() ?? '0'}',
                              textScaleFactor: 1,
                              style:
                                  TextStyle(color: Colors.black, fontFamily: 'Baloo', fontSize: 15),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 15),
                            child: Center(
                              child: Text(
                                'Recovered Cases:   ${data3[lastTest3].toInt() ?? '0'}',
                                textScaleFactor: 1,
                                style: TextStyle(
                                    color: Colors.black, fontFamily: 'Baloo', fontSize: 15),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: AutoSizeText(
                                'COVID-19 Top Recent News',
                                textScaleFactor: 1,
                                maxLines: 1,
                                maxFontSize: 35,
                                style: TextStyle(
                                    fontSize: 35, fontFamily: 'Baloo', color: Colors.black),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                              child: AutoSizeText(
                                'Last Updated: $timeNowDate',
                                textScaleFactor: 1,
                                maxLines: 1,
                                maxFontSize: 20,
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'Baloo', color: Colors.black),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 15),
                            child: Center(
                              child: FlatButton(
                                color: Colors.indigoAccent,
                                onPressed: () {
                                  getDeviceInfoDate();
                                  getNewsData();
                                },
                                child: Text(
                                  'Sync Articles',
                                  textScaleFactor: 1,
                                  style: TextStyle(color: Colors.white, fontFamily: 'Baloo'),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                            ),
                          ),
                          ArticleTile(
                              addBotLine: false,
                              title: news1a == null ? '' : '$news1a',
                              desc: news1b == null ? '' : '$news1b',
                              url: '$news1c'),
                          ArticleTile(
                              addBotLine: false,
                              title: news2a == null ? '' : '$news2a',
                              desc: news2b == null ? '' : '$news2b',
                              url: '$news2c'),
                          ArticleTile(
                              addBotLine: false,
                              title: news3a == null ? '' : '$news3a',
                              desc: news3b == null ? '' : '$news3b',
                              url: '$news3c'),
                          ArticleTile(
                              addBotLine: false,
                              title: news4a == null ? '' : '$news4a',
                              desc: news4b == null ? '' : '$news4b',
                              url: '$news4c'),
                          ArticleTile(
                              addBotLine: false,
                              title: news5a == null ? '' : '$news5a',
                              desc: news5b == null ? '' : '$news5b',
                              url: '$news5c'),
                          ArticleTile(
                              addBotLine: false,
                              title: news6a == null ? '' : '$news6a',
                              desc: news6b == null ? '' : '$news6b',
                              url: '$news6c'),
                          ArticleTile(
                              addBotLine: false,
                              title: news7a == null ? '' : '$news7a',
                              desc: news7b == null ? '' : '$news7b',
                              url: '$news7c'),
                          ArticleTile(
                              addBotLine: false,
                              title: news8a == null ? '' : '$news8a',
                              desc: news8b == null ? '' : '$news8b',
                              url: '$news8c'),
                          ArticleTile(
                              addBotLine: false,
                              title: news9a == null ? '' : '$news9a',
                              desc: news9b == null ? '' : '$news9b',
                              url: '$news9c'),
                          ArticleTile(
                              addBotLine: true,
                              title: news10a == null ? '' : '$news10a',
                              desc: news10b == null ? '' : '$news10b',
                              url: '$news10c'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
