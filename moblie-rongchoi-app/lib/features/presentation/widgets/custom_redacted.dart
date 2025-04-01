import 'package:flutter/material.dart';
import 'package:redacted/redacted.dart';

class RedactedConfig {
  final BuildContext context;
  final bool redact;
  final RedactedConfiguration? configuration;

  const RedactedConfig(
      {required this.context, required this.redact, this.configuration});
}
