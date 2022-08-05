import 'package:fl_three_state_switch/src/theme/colors.dart';
import 'package:fl_three_state_switch/src/utils/duration.extension.dart';
import 'package:flutter/material.dart';

/// This enum is for switch states.
/// We find next state with [nextState] function
enum SwitchState {
  start("start"),
  middle("middle"),
  end("end");

  final String value;
  const SwitchState(this.value);

  SwitchState nextState() {
    switch (this) {
      case start:
        return SwitchState.middle;
      case middle:
        return SwitchState.end;
      case end:
        return SwitchState.start;
      default:
        return SwitchState.middle;
    }
  }
}

class FlThreeStateSwtich extends StatelessWidget {
  const FlThreeStateSwtich({
    Key? key,
    required this.onChanged,
    this.dotVerticalPadding = 2,
    this.dotHorizontalPadding = 1,
    this.startBackgroundColor,
    this.middleBackgroundColor,
    this.endBackgroundColor,
    this.dotColor,
    this.disableBackgroundColor,
    this.disableDotColor,
    this.width = 70,
    this.height = 30,
    this.child,
    required this.state,
    this.borderRadius,
    this.disable = false,
    this.dotShadow,
  }) : super(key: key);

  /// Function for handling [SwitchState] is changed.
  /// It return [SwitchState] in function as argument for you to handle your functionality.
  final Function(SwitchState) onChanged;

  /// Switch width
  final double? width;

  /// Switch height
  final double? height;

  /// Dot vertical padding from Switch Container
  final double? dotVerticalPadding;

  /// Dot horizonatl padding from Switch Container
  final double? dotHorizontalPadding;

  /// Border Radius of Switch
  final BorderRadius? borderRadius;

  /// Background Color of Start state of [SwitchState]
  final Color? startBackgroundColor;

  /// Background Color of Middle state of [SwitchState]
  final Color? middleBackgroundColor;

  /// Background Color of End state of [SwitchState]
  final Color? endBackgroundColor;

  /// Color for Switch dot
  final Color? dotColor;

  /// Color for background of switch in disable mode
  final Color? disableBackgroundColor;

  /// Color for dot in disable mode
  final Color? disableDotColor;

  /// You can change dot in switch and customize with your widget
  final Widget? child;

  /// State of swtich
  final SwitchState state;

  /// Disable or Enable switch
  final bool? disable;

  /// Box Shadow for Dot
  final List<BoxShadow>? dotShadow;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: borderRadius ??
          BorderRadius.circular(
            200,
          ),
      onTap: !disable!
          ? () {
              onChanged(state.nextState());
            }
          : null,
      child: Stack(
        children: [
          AnimatedContainer(
            duration: 300.milliseconds,
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: !disable!
                  ? state == SwitchState.start
                      ? startBackgroundColor ?? SwitchColors.backgroundColor
                      : state == SwitchState.middle
                          ? middleBackgroundColor ??
                              SwitchColors.backgroundColor
                          : endBackgroundColor ?? SwitchColors.backgroundColor
                  : SwitchColors.disableBackgroundColor,
              borderRadius: borderRadius ??
                  BorderRadius.circular(
                    200,
                  ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: dotHorizontalPadding!,
              vertical: dotVerticalPadding!,
            ),
            child: AnimatedAlign(
              duration: 300.milliseconds,
              alignment: state == SwitchState.start
                  ? AlignmentDirectional.centerStart
                  : state == SwitchState.middle
                      ? AlignmentDirectional.center
                      : AlignmentDirectional.centerEnd,
              child: child ??
                  Container(
                    height: height,
                    width: height,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: !disable!
                          ? dotColor ?? SwitchColors.dotColor
                          : SwitchColors.disableDotColor,
                      boxShadow: !disable!
                          ? dotShadow ??
                              [
                                const BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 10,
                                  spreadRadius: -5,
                                ),
                              ]
                          : null,
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
