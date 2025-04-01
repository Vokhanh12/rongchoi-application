import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redacted/redacted.dart';
import 'package:rongchoi_application/features/presentation/bloc/tranlation_bloc/tranlation_bloc.dart';
import 'package:rongchoi_application/features/presentation/utils/tranlation_util.dart';

class CustomTextbutton extends StatelessWidget {
  const CustomTextbutton(
      {super.key,
      required this.label,
      required this.onPressed,
      this.buttonStyle});
  final String label;
  final Function() onPressed;
  final ButtonStyle? buttonStyle;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TranlationBloc, TranlationState, String>(
      selector: (state) {
        if (state is GetAllTranlationsLocalState) {
          return TranlationUtil.getTranlationsByCode(
              state.tranlationItems, label);
        }
        return label;
      },
      builder: (context, translatedText) {
        return Container(
                width: 150,
                height: 35,
                child: (translatedText == 'none')
                    ? TextButton(
                        style: buttonStyle,
                        onPressed: onPressed,
                        child: Text(translatedText),
                      )
                    : SizedBox())
            .redacted(
          context: context,
          redact: true,
          configuration: RedactedConfiguration(
            animationDuration: Duration(milliseconds: 800),
          ),
        );
      },
    );
  }
}
