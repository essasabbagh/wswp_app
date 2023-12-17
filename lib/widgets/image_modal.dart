import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';
import 'package:wswp_app/utils/context_ext.dart';

class FullScreenImageModal extends StatelessWidget {
  final String imageUrl;
  final String webUrl;
  final String name;

  const FullScreenImageModal({
    super.key,
    required this.imageUrl,
    required this.webUrl,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: PhotoView(
              imageProvider:
                  NetworkImage(imageUrl), // Use NetworkImage for web images
              minScale: PhotoViewComputedScale.contained * 0.8,
              maxScale: PhotoViewComputedScale.covered * 2,
              backgroundDecoration: const BoxDecoration(
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                webUrl.isEmpty
                    ? Text(
                        name,
                        style: context.textTheme.titleLarge!
                            .copyWith(color: Colors.white),
                      )
                    : GestureDetector(
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: webUrl));
                          context.showSnackBar('Copy to Clipboard successfully');
                          // copied successfully
                        },
                        child: Text(
                          'Web URL: $webUrl',
                          style: const TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => context.popFalse(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
