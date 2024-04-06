import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'This privacy policy governs your use of the mobile application Our Dinny application created by Flutter Verse .',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Information Collection and Use',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'We collect the following information about users of the Application:',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              '- User Provided Information: The Application collects the information you provide when you register for an account, including your name, email address, password, and profile information.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '- Documents Related to Food Safety: The Application may collect documents related to food safety that you upload for verification purposes.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '- Menu Card Images: The Application may collect images of menu cards that you upload for display purposes.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '- Time: The Application may collect the time you select for booking tables.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Use of Collected Information',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'We use the information we collect to:',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              '- Provide and maintain the Application',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '- Process and manage table bookings',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '- Improve user experience',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '- Respond to user inquiries and support requests',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '- Analyze and monitor usage trends',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Data Security',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'We are committed to protecting the security of your information and use industry-standard security measures to safeguard it.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Data Sharing',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'We may share your information with third parties in the following circumstances:',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              '- With service providers who assist us in operating the Application',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '- When required by law or to protect our rights',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Changes to This Privacy Policy',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'We may update our privacy policy from time to time. We will notify you of any changes by posting the new privacy policy on this page.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Contact Us',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'If you have any questions or suggestions about our privacy policy, please contact us at ourdinny@gmail.com.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'https://anjana-pv.github.io/policyOfAdmin/',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}


