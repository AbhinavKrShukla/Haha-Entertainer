import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  Text hText (context, heading) {
    return Text (
      heading,
      style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.primary
      ),
    );
  }

  Column pText (context, text) {
    return Column(
      children: [
        Text (
          text,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.secondary
          ),
        ),

        const SizedBox(height: 25,),
      ],
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
        title: Text("Privacy Policy",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 25,
              color: Theme.of(context).colorScheme.primary
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              pText(context,
                "This Privacy Policy outlines how 'Haha Entertainer' collects, uses, and protects your personal information."
              ),

              hText(context, "Information We Collect"),
              pText(context,
                "We do not collect any personal information from you."
              ),

              hText(context,"How We Use Your Information"),
              pText(context,
                  "Since we do not collect any personal information, there is no information to use."
              ),

              hText(context,"Data Sharing"),
              pText(context,
                  "We do not share any information with third parties."
              ),

              hText(context,"Your Rights"),
              pText(context,
                  "As we do not collect any personal information, you have no rights under this policy."
              ),

              hText(context,"Changes to This Policy"),
              pText(context,
                  "We reserve the right to modify this Privacy Policy at any time. Any changes will be posted in this app."
              ),

            ],
          ),
        ),
      ),
    );
  }
}
