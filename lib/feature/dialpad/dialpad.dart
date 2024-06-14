import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DialerScreen extends StatelessWidget {
  const DialerScreen({super.key});
  void _launchUrl(Uri uri)async{
    try{
      if(await canLaunchUrl(uri)){
        await launchUrl(uri,mode: LaunchMode.externalApplication);
      }
    }catch(e){
      print("this is wrer i come");
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialer Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _launchUrl(Uri.parse('tel:+123156789')),
          child: Text('Dial Phone Number'),
        ),
      ),
    );
  }
}