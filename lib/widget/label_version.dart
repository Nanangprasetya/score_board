import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:score_board/core/config/environment.dart';
import 'package:score_board/utils/colors.dart';
import 'package:yaml/yaml.dart';

class LabelVersion extends StatelessWidget {
  const LabelVersion({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder(
        future: rootBundle.loadString("pubspec.yaml"),
        builder: (context, snapshot) {
          String version = "";
          if (snapshot.hasData) {
            var yaml = loadYaml(snapshot.data);
            version = yaml["version"];
          }

          final style = TextStyle(
            fontSize: 12,
            color: AppColors.text3,
          );
          return Center(
            child: Environment.value.debug
                ? Text(
                    'v${version.split("+")[0]}-dev',
                    style: style,
                  )
                : Text(
                    'v${version.split("+")[0]}',
                    style: style,
                  ),
          );
        },
      ),
    );
  }
}
