import 'package:flutter/material.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  Column hText (context, heading) {
    return Column(
      children: [
        const SizedBox(height: 25,),

        Text (
          heading,
          style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.primary
          ),
        ),
      ],
    );
  }

  Text pText (context, text) {
    return Text (
          text,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.secondary
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
        title: Text("Terms of Service",
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
                  "By using 'Haha Entertainment', you agree to the following terms and conditions:"
              ),


              hText(context, "App Usage"),
              pText(context,
                  "You may use 'Haha Entertainment' for personal, non-commercial purposes."
              ),
              pText(context,
                  "You agree not to misuse the app or engage in any illegal activities."
              ),


              hText(context,"Content"),
              pText(context,
                  "The content displayed in the app is for informational purposes only."
              ),
              pText(context,
                  "We do not guarantee the accuracy, completeness, or reliability of the content."
              ),


              hText(context,"Limitation of Liability"),
              pText(context,
                  "We shall not be liable for any damages arising from the use or inability to use the app."
              ),

              hText(context,"Indemnification"),
              pText(context,
                  "You agree to indemnify and hold us harmless from any claims arising from your use of the app."
              ),

              hText(context,"Termination"),
              pText(context,
                  "We may terminate your access to the app at any time, without notice. "
              ),

            ],
          ),
        ),
      ),
    );
  }
}
