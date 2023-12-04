import 'package:flutter/material.dart';
import 'package:islami/api/api_manager.dart';
import 'package:islami/taps/radio_widget.dart';

class RadioTap extends StatelessWidget {
  RadioTap({super.key});

  String currentState = 'pause';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: Image.asset("assets/images/radio_image.png")),
        FutureBuilder(
          future: ApiManager.getApiData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("there was an error try again later"),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            var radio = snapshot.data?.radios ?? [];
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return RadioWidget(
                    radioData: radio[index],
                  );
                },
                physics: const PageScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: radio.length,
              ),
            );
          },
        ),
      ],
    );
  }
}
