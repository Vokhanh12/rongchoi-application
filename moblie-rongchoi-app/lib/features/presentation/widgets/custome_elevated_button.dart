import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redacted/redacted.dart';
import 'package:rongchoi_application/core/config/app_redacted.dart';
import 'package:rongchoi_application/features/presentation/bloc/tranlation_bloc/tranlation_bloc.dart';
import 'package:rongchoi_application/features/presentation/utils/tranlation_util.dart';
import 'package:rongchoi_application/features/presentation/widgets/custom_redacted.dart';
import 'package:rongchoi_application/features/presentation/widgets/custom_text.dart';

class ElevatedButtonConfig {
  final Function()? onPressed;
  final TextConfig textConfig;
  final double? width;
  final double? height;
  const ElevatedButtonConfig(
      {required this.onPressed,
      required this.textConfig,
      this.width = double.infinity,
      this.height = 55});
}

class CustomeElevatedButton extends StatelessWidget {
  final ElevatedButtonConfig config;
  const CustomeElevatedButton({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranlationBloc, TranlationState>(
      builder: (context, state) {
        if (state is LoadingTranlationState) {
          return Container(
            width: config.width,
            height: config.height,
          ).redacted(
            context: context,
            redact: true,
            configuration: AppRedacted.redactedConfiguration,
          );
          ;
        } else if (state is GetAllTranlationsLocalState) {
          return Container(
              width: config.width,
              height: config.height,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
                ),
                child: CustomText(
                  config: config.textConfig.copyWith(
                      label: TranlationUtil.getTranlationsByCode(
                          state.tranlationItems, config.textConfig.label)),
                  redactedConfig: RedactedConfig(
                      context: context,
                      redact: false,
                      configuration: AppRedacted.redactedConfiguration),
                ),
              ));
        }

        return Container();
      },
    );
  }
}
