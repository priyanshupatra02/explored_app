import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class TermsAndConditionsPage extends StatelessWidget {
  final String url;
  const TermsAndConditionsPage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return TermsAndConditionsView(
      url: url,
    );
  }
}

class TermsAndConditionsView extends ConsumerStatefulWidget {
  final String url;
  const TermsAndConditionsView({super.key, required this.url});

  @override
  ConsumerState<TermsAndConditionsView> createState() => _TermsAndConditionsViewState();
}

class _TermsAndConditionsViewState extends ConsumerState<TermsAndConditionsView> {
  final controller = WebViewController();
  @override
  void initState() {
    super.initState();

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    double fontSize = ResponsiveValue<double>(
      context,
      conditionalValues: [
        Condition.equals(name: MOBILE, value: Theme.of(context).textTheme.bodyLarge?.fontSize),
        Condition.equals(name: TABLET, value: Theme.of(context).textTheme.titleMedium?.fontSize),
        Condition.equals(name: DESKTOP, value: Theme.of(context).textTheme.titleLarge?.fontSize),
        Condition.equals(name: '4K', value: Theme.of(context).textTheme.titleLarge?.fontSize),
      ],
    ).value;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "Terms and Conditions".hardCoded,
      //   ),
      // ),
      body: SafeArea(
        child: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}
