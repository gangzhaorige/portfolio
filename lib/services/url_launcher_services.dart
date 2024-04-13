import 'package:my_portfolio/common/projects/project.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {

  static UrlLauncherService getInstance() => UrlLauncherService._();

  UrlLauncherService._();

  Future<void> launchInBrowser(Link link) async {
    Uri url = Uri(
      scheme: 'https',
      host: link.getHost(),
      path: link.getPath(),
    );
    if (!await launchUrl(
      url,
      mode: LaunchMode.platformDefault,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}

