import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  Text hText (context, heading) {
    return Text (
      heading,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.primary
      ),
    );
  }

  Text pText2 (context, heading) {
    return Text (
      heading,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.primary
      ),
    );
  }

  RichText sText (context, label, value) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.secondary,
        ),
        children: [
          TextSpan(text: "$label : "),
          TextSpan(text: "$value", style: const TextStyle(fontWeight: FontWeight.w400))
        ]
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text("About",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 25,
            color: Theme.of(context).colorScheme.primary
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            hText(context, "App Info"),
            const SizedBox(height: 12,),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sText(context, "App Name", "Haha Entertainer"),
                  const SizedBox(height: 8,),
                  sText(context, "Version", "1.0.0"),
                  const SizedBox(height: 8,),
                  sText(context, "Developer", "Abhinav Kumar Shukla"),
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
