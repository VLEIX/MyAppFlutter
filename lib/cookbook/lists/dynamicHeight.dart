import 'package:flutter/material.dart';

class DynamicHeightList extends StatelessWidget {
  final List<String> items = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
    'como',
    'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
    'como',
    'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium',
    'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
    'como',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
    'como',
    'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
    'como',
    'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium'
  ];

  @override
  Widget build(BuildContext context) {
    final title = 'Dynamic Height';

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Container(
                child: ListTile(
                  title: Text(items[index]),
                ),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 2.0, color: Colors.blueAccent)
                    )
                ),
              );
            })
    );
  }
}
