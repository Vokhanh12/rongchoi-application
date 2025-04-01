import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redacted/redacted.dart';
import 'package:rongchoi_application/features/presentation/bloc/tranlation_bloc/tranlation_bloc.dart';
import 'package:rongchoi_application/features/presentation/utils/tranlation_util.dart';
import 'package:rongchoi_application/features/presentation/widgets/custom_text.dart';

class CheckboxConfig {
  final Function(bool?)? onChanged;
  final bool isChecked;
  final TextConfig textConfig;

  const CheckboxConfig({
    required this.onChanged,
    required this.isChecked,
    required this.textConfig,
  });
}

class CustomeCheckbox extends StatefulWidget {
  final CheckboxConfig config;

  const CustomeCheckbox({super.key, required this.config});

  @override
  State<CustomeCheckbox> createState() => _CustomeCheckboxState();
}

class _CustomeCheckboxState extends State<CustomeCheckbox> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.config.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranlationBloc, TranlationState>(
      builder: (context, state) {
        String translatedText = widget.config.textConfig.label;

        if (state is GetAllTranlationsLocalState) {
          translatedText = TranlationUtil.getTranlationsByCode(
              state.tranlationItems, widget.config.textConfig.label);
        } else if (state is LoadingTranlationState) {
          return SizedBox(
            width: 30,
            height: 20,
          );
        }

        return Row(
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: (translatedText == 'none')
                  ? Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value ?? false;
                        });
                        widget.config.onChanged?.call(isChecked);
                      },
                      checkColor: Colors.black,
                      activeColor: Colors.amber,
                      side: BorderSide(
                        color: isChecked ? Colors.white : Colors.grey,
                        width: 2.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                    ),
            ),
            const SizedBox(width: 5),
            Text(
              translatedText,
              style: widget.config.textConfig.style,
              textAlign: widget.config.textConfig.textAlign,
              maxLines: widget.config.textConfig.maxLines,
              overflow: widget.config.textConfig.overflow,
            ),
          ],
        ).redacted(
          context: context,
          redact: true,
          configuration: RedactedConfiguration(
            animationDuration: Duration(milliseconds: 800),
          ),
        );
      },
    ).redacted(
      context: context,
      redact: true,
      configuration: RedactedConfiguration(
        animationDuration: const Duration(milliseconds: 800),
      ),
    );
  }
}
