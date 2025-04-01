import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redacted/redacted.dart';
import 'package:rongchoi_application/features/presentation/bloc/tranlation_bloc/tranlation_bloc.dart';
import 'package:rongchoi_application/features/presentation/utils/tranlation_util.dart';
import 'package:rongchoi_application/features/presentation/widgets/custom_redacted.dart';

class TextConfig {
  final String label;
  final bool? autoTranslate;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const TextConfig({
    required this.label,
    this.autoTranslate = true,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  TextConfig copyWith({
    String? label,
    bool? autoTranslate,
    TextStyle? style,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return TextConfig(
      label: label ?? this.label,
      autoTranslate: autoTranslate ?? this.autoTranslate,
      style: style ?? this.style,
      textAlign: textAlign ?? this.textAlign,
      maxLines: maxLines ?? this.maxLines,
      overflow: overflow ?? this.overflow,
    );
  }
}

class CustomText extends StatelessWidget {
  final TextConfig config;
  final RedactedConfig redactedConfig;

  const CustomText(
      {super.key, required this.config, required this.redactedConfig});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TranlationBloc, TranlationState, String>(
      selector: (state) {
        if (state is GetAllTranlationsLocalState) {
          return TranlationUtil.getTranlationsByCode(
              state.tranlationItems, config.label);
        }
        return config.label;
      },
      builder: (context, translatedText) {
        return Text(
          config.label,
          style: config.style,
          textAlign: config.textAlign,
          maxLines: config.maxLines,
          overflow: config.overflow,
        ).redacted(
            context: redactedConfig.context,
            redact: redactedConfig.redact,
            configuration: redactedConfig.configuration);
      },
    );
  }
}
