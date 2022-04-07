import 'package:url_launcher/url_launcher.dart';

class HTML_redirect {
  void htmlOpenLink(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not launch $url";
    }
  }
}
