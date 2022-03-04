import 'package:flutter/material.dart';
import 'package:score_board/utils/colors.dart';

class AppSlider extends StatefulWidget {
  final double min;
  final double max;
  final double initialValue;
  final bool showMinMaxText;
  final Color primaryColor;
  final Color accentColor;
  final Color divisionColor;
  final int divisions;
  final TextStyle minMaxTextStyle;
  final String label;
  final Function(double) onChange;
  const AppSlider(
      {@required this.min,
      @required this.max,
      @required this.divisions,
      @required this.onChange,
      @required this.label,
      this.divisionColor = AppColors.blue,
      this.initialValue,
      this.primaryColor = AppColors.blue,
      this.accentColor = Colors.white,
      this.showMinMaxText = true,
      this.minMaxTextStyle = const TextStyle(fontSize: 14),
      Key key})
      : super(key: key);

  @override
  _AppSliderState createState() => _AppSliderState();
}

class _AppSliderState extends State<AppSlider> {
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: widget.primaryColor,
        inactiveTrackColor: widget.primaryColor.withAlpha(35),
        trackShape: const RoundedRectSliderTrackShape(),
        trackHeight: 4.0,
        thumbColor: widget.primaryColor,
        overlayColor: widget.primaryColor.withAlpha(35),
        tickMarkShape: const RoundSliderTickMarkShape(),
        activeTickMarkColor: widget.accentColor,
        inactiveTickMarkColor: widget.divisionColor,
        valueIndicatorTextStyle:
            const TextStyle(color: Colors.white, fontSize: 10.0),
      ),
      child: Slider(
        min: widget.min,
        max: widget.max,
        label: widget.label,
        value: widget.initialValue,
        divisions: widget.divisions,
        onChanged: (value) => widget.onChange(value),
      ),
    );
  }
}
