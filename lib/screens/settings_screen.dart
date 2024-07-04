import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<List<String>> groupMembers = [
      ['Long Tu', 'APP Developer', 'long.tu@ue-germany.de'],
      ['Kelvin Amoah', 'APP Developer', 'kelvin.amoah@ue-germany.de'],
      [
        'Lukman Oladipupo Olateju ',
        'APP Developer',
        'lukmanoladipupo.olateju@ue-germany.de'
      ],
      ['Zhang Hebin', 'Website Developer', 'hebin.zhang@ue-germany.de'],
      [
        'Carlos Alejandro Madrid Mata',
        'Website Developer',
        'carlosalejandro.madridmata@ue-germany.de'
      ],
    ];
    final isPortrait = MediaQuery
        .of(context)
        .orientation == Orientation.portrait;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          toolbarHeight: 50,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white70),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/');
            },
          ),
          title: isPortrait ? null : _buildTitle(),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
          ),
          child: Center(
            child: Container(
              margin: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromRGBO(0, 0, 0, 0.8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  children: [
                    if (isPortrait) _buildTitle(),
                    const SizedBox(height: 20),
                    const Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          'We extend a warm welcome to our newest team member at TZC. Our team of dedicated developers and designers is committed to providing customers like you with the best user experience, ensuring you have access to accurate and real-time information at your fingertips. We began as a group of university students who, driven by a passion for technology, established our company. Our team is now comprised of three creative minds, and we are proud to have a deep understanding of meteorology and cutting-edge technology. We are dedicated to delivering a seamless user experience and continuously work on your feedback to improve our app performance and your happiness. Our teams expertise lies in the design and maintenance of functional and user-friendly interfaces, as well as the analysis of accurate real-time data. Weather and weather forecasts are among the few factors that impact our daily lives. It is therefore important that this data is accessible in the most accurate and comprehensible format, so that users can make informed decisions about their day. It is our goal at TZC to provide you with the best user experience.',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () =>
                          _launchURL(
                              'https://zhangagaga.github.io/weather-web/index.html'),
                      child: const Text('Visit our Website'),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.info,
          color: Colors.white70,
          size: 30,
        ),
        SizedBox(width: 10),
        Text(
          'About Us',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white70,
          ),
        ),
        SizedBox(width: 60),
      ],
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      if (!await launchUrl(uri)) {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print('Error launching URL: $e');
      // Handle error gracefully, e.g., show a snackbar or alert dialog
    }
  }
}
