import 'dart:convert';

import 'package:http/http.dart' as http;

class Data {

 static Future fetchAlbum() async {
    var headers = {
      'x-rapidapi-key': 'b79d4c838cmshffc82f9505a01c6p18abb9jsnad91a6679f36',
      'x-rapidapi-host':
          'quotes-inspirational-quotes-motivational-quotes.p.rapidapi.com'
    };

    // The main difference between a URL and a URI is that a URL specifies the location of a resource on the internet, while a URI can be used to identify any type of resource, not just those on the internet
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://quotes-inspirational-quotes-motivational-quotes.p.rapidapi.com/quote?token=ipworld.info'));

    
    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      var responseString = await response.stream.bytesToString();
      final decodedMap = json.decode(responseString);
      print(decodedMap['text']);
      return decodedMap;
      // quote = decodedMap['text'];
      // print(decodedMap['name']);
    } else {
      print(response.reasonPhrase);
    }
  }

}




