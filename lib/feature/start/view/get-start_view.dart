// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:ntigradproject/core/utils/app_images.dart';

class GetStartView extends StatelessWidget {
  const GetStartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image.asset(
            MyAppImage.getstart,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.45,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,

                colors: [
                  Colors.black.withAlpha(160),
                  Colors.black.withAlpha(0),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Text(
                    '  You want \nAuthentic, here \n  you go! ',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                ),
                Text(
                  'Find it here, buy it now!',
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () {}, child: Text("login")),
                ),
                ElevatedButton(onPressed: () async {}, child: Text('register')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
