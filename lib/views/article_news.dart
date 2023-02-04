import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class ArticleNews extends StatefulWidget {
  final String blogUrl;
  const ArticleNews({super.key, required this.blogUrl});

  @override
  State<ArticleNews> createState() => _ArticleNewsState();
}

class _ArticleNewsState extends State<ArticleNews> {
  InAppWebViewController? webViewController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Flutter', style: TextStyle(color: Colors.black)),
            Text(
              'News',
              style: TextStyle(color: Colors.blue[300]),
            ),
            const Opacity(
                opacity: 0,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Icon(Icons.search),
                ))
          ],
        ),
      ),
      body: Container(
        child: InAppWebView(
          onWebViewCreated: (controller) => webViewController = controller,
          initialUrlRequest: URLRequest(url: Uri.parse(widget.blogUrl)),
        ),
      ),
    );
  }
}
