import 'package:flutter/material.dart';
import 'package:news_app/widgets/custom_scaffold.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailWeb extends StatelessWidget {
  static const routeName = '/detail-web';

  final String url;
  const DetailWeb({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
