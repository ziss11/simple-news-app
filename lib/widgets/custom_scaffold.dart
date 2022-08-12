import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;

  const CustomScaffold({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            body,
            _shortAppBar(context),
          ],
        ),
      ),
    );
  }

  Card _shortAppBar(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 16,
            ),
            child: Text(
              'News',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ],
      ),
    );
  }
}
