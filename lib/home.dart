import 'package:flutter/material.dart';
import 'package:gr_analysis/ui/pages/change_notifier_screen.dart';
import 'package:gr_analysis/ui/pages/future_provider_page.dart';
import 'package:gr_analysis/ui/pages/provider_page.dart';
import 'package:gr_analysis/ui/pages/state_provider_screen.dart';
import 'package:gr_analysis/ui/pages/stream_provider_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Center(
            child: Text(
          "RIVERPOD",
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 50,
                  width: screenSize.width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((ctx) => ProviderPage())));
                      },
                      child: Center(
                          child: Text("Provider",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black))))),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 50,
                  width: screenSize.width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((ctx) => StateProviderPage())));
                      },
                      child: Center(
                        child: Text(" State Provider",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                      ))),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 50,
                  width: screenSize.width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((ctx) => FutureStateProviderPage())));
                      },
                      child: Center(
                        child: Text("Future Provider",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                      ))),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 50,
                  width: screenSize.width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((ctx) => StreamProviderPage())));
                      },
                      child: Center(
                        child: Text(" Stream Provider",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                      ))),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 50,
                  width: screenSize.width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((ctx) => ChangeNotifierScreen())));
                      },
                      child: Center(
                        child: Text(" Change Notifier Provider",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                      ))),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 50,
                  width: screenSize.width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: () {},
                      child: Center(
                        child: Text(" State Notifier Provider",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
