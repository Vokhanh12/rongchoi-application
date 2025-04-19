import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'package:rongchoi_application/core/config/app_redacted.dart';
import 'package:rongchoi_application/core/config/space.dart';
import 'package:rongchoi_application/core/constants/assets.dart';
import 'package:rongchoi_application/core/constants/corlos.dart';
import 'package:rongchoi_application/core/validator/validator.dart';
import 'package:rongchoi_application/features/presentation/screen/otp.dart';
import 'package:rongchoi_application/features/presentation/widgets/auto_form.dart';
import 'package:rongchoi_application/features/presentation/widgets/custom_redacted.dart';
import 'package:rongchoi_application/features/presentation/widgets/custom_text.dart';
import 'package:rongchoi_application/features/presentation/widgets/custom_textbutton.dart';
import 'package:rongchoi_application/features/presentation/widgets/custom_textformfield.dart';
import 'package:rongchoi_application/features/presentation/widgets/custome_checkbox.dart';
import 'package:rongchoi_application/features/presentation/widgets/custome_column_data.dart';
import 'package:extension_type_unions/extension_type_unions.dart';
import 'package:rongchoi_application/features/presentation/widgets/custome_elevated_button.dart';
import 'package:rongchoi_application/features/presentation/widgets/custome_row_data.dart';
import 'package:rongchoi_application/features/presentation/widgets/secondary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Artboard? _artboard;
  final List<String> _animations = [
    'Timeline 1',
    'picking'
  ]; // tên animation trong file Rive
  int _currentIndex = 0;
  RiveAnimationController? _controller;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final Validators _validators = Validators();

  late FocusNode _usernameFocusNode;
  late FocusNode _passwordForcusNode;

  @override
  void initState() {
    _usernameFocusNode = FocusNode();
    _passwordForcusNode = FocusNode();

    super.initState();

    rootBundle
        .load('assets/animations/animated_login_character.riv')
        .then((data) {
      final file = RiveFile.import(data);
      final artboard = file.mainArtboard;

      _controller = SimpleAnimation(_animations[_currentIndex]);
      artboard.addController(_controller!);

      setState(() => _artboard = artboard);
    });
  }

  void _changeAnimation() {
    if (_artboard == null) return;

    // Gỡ animation hiện tại
    _artboard!.removeController(_controller!);

    // Chuyển sang animation kế tiếp
    _currentIndex = (_currentIndex + 1) % _animations.length;

    _controller = SimpleAnimation(_animations[_currentIndex]);
    _artboard!.addController(_controller!);

    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();

    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Positioned.fill(
              bottom: 470,
              child: _artboard == null
                  ? const Center(child: CircularProgressIndicator())
                  : Rive(
                      artboard: _artboard!,
                      fit: BoxFit.contain,
                    ),
            ),

            decorLeft01,
            decorRight02,
            decorRight03,
            //decorBottomLeft04,
            Padding(padding: Space.hf(1.3), child: body

                // child: Form(
                //   key: _formKey,
                //   child: Column(
                //     children: [
                //       CustomTextFormField(
                //         label: "RC.Username",
                //         controller: _usernameController,
                //       ),
                //       Space.yf(1.3),
                //       CustomTextFormField(
                //           label: "RC.Password",
                //           controller: _passwordController,
                //           validator: _validators.validatePassword),
                //       Space.yf(.3),
                //       Row(
                //         children: [
                //           Row(
                //             children: [
                //               CustomeCheckbox(onChanged: (isChecked){}, value: true),
                //               CustomText(text: "RC.Remember")
                //             ],
                //           ),
                //           Spacer(),
                //           CustomText(
                //             text: "RC.ForgotPassword",
                //             style: AppText.b2,
                //           ),
                //         ],
                //       ),
                //       Space.yf(2.5),
                //       // BlocConsumer<SignInBloc, SignInState>(
                //       //   listener: (context, state) {
                //       //     if (state.status == SignInStatus.error) {
                //       //       showErrorAuthBottomSheet(context);
                //       //     }
                //       //     if (state.status == SignInStatus.success) {
                //       //       showSuccessfulAuthBottomSheet(context, false);
                //       //     }
                //       //   },
                //       //   builder: (context, state) {
                //       //     return customElevatedButton(
                //       //       onTap: () {
                //       //         if (_formKey.currentState!.validate()) {
                //       //           context.read<SignInBloc>().add(
                //       //                 SignInWithCredential(
                //       //                   email: _emailController.text.trim(),
                //       //                   password: _passwordController.text.trim(),
                //       //                 ),
                //       //               );
                //       //         }
                //       //       },
                //       //       text: (state.status == SignInStatus.submitting)
                //       //           ? AppStrings.wait
                //       //           : "Login".toUpperCase(),
                //       //       heightFraction: 20,
                //       //       width: double.infinity,
                //       //       color: AppColors.commonAmber,
                //       //     );
                //       //   },
                //       // ),
                //       Space.yf(2.5),
                //       CustomeElevatedButton(text: "RC.Login")
                //     ],
                //   ),
                // ),
                ),
          ],
        ),
      ),
    );
  }

  Widget get body => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 235,
            ),
            child: Text(
              '',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter',
              ),
            ),
          ),
          AutoForm(
              child: Union3<CustomeColumnData, CustomeRowData, Widget>.in1(
                  CustomeColumnData(
            children: [
              CustomTextFormField(
                label: 'RC.Username',
                onTap: () {
                  _changeAnimation();
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(label: 'RC.Password'),
            ],
          ))),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              CustomeCheckbox(
                config: CheckboxConfig(
                  textConfig: TextConfig(
                    label: "RC.RememberMe",
                  ),
                  onChanged: (value) {},
                  isChecked: false,
                ),
              ),
              Spacer(),
              CustomTextbutton(
                label: 'RC.ForgotPassword',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OtpScreen()),
                  );
                },
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          CustomeElevatedButton(
            config: ElevatedButtonConfig(
                onPressed: () {}, textConfig: TextConfig(label: 'RC.Login')),
          ),
          SizedBox(
            height: 30,
          ),
          signUpPrompt,
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              CustomText(
                  config: TextConfig(label: 'RC.Or'),
                  redactedConfig: RedactedConfig(
                      context: context,
                      redact: true,
                      configuration: AppRedacted.redactedConfiguration)),
              const SizedBox(height: 24),
              SecondaryButton(
                  height: 56,
                  textColor: AppColors.grayscaleDark100,
                  width: 280,
                  onTap: () {},
                  borderRadius: 24,
                  bgColor: AppColors.background.withOpacity(0.3),
                  text: 'Continue with Google',
                  icons: AppAssets.googleIcon),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          termAndPrivacyText
        ],
      );

  Widget get background => Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
      ));

  Widget get decorLeft01 => Positioned(
        child: Align(
          alignment: Alignment.topLeft,
          child: SvgPicture.asset(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.2,
              AppAssets.loginDecore01),
        ),
      );

  Widget get decorRight02 => Positioned(
        top: MediaQuery.of(context).size.height / 7,
        right: 0,
        child: SvgPicture.asset(
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height * 0.2,
            AppAssets.loginDecore02),
      );

  Widget get decorRight03 => Align(
        alignment: Alignment.topRight,
        child: SvgPicture.asset(
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height * 0.2,
            AppAssets.loginDecore03),
      );

  Widget get decorBottomLeft04 => Positioned(
        bottom: 0,
        left: 0,
        child: SvgPicture.asset(
          width: MediaQuery.of(context).size.width * 0.2,
          height: MediaQuery.of(context).size.height * 0.2,
          AppAssets.loginDecore04,
        ),
      );

  Widget get signUpPrompt => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              config: TextConfig(
                  label: 'RC.HaveAccount', textAlign: TextAlign.right),
              redactedConfig: RedactedConfig(
                  context: context,
                  redact: true,
                  configuration: AppRedacted.redactedConfiguration),
            ),
            SizedBox(
              width: 7,
            ),
            CustomText(
              config:
                  TextConfig(label: 'RC.SignUpNow', textAlign: TextAlign.right),
              redactedConfig: RedactedConfig(
                  context: context,
                  redact: true,
                  configuration: AppRedacted.redactedConfiguration),
            ),
            //tranlate
          ],
        ),
      );

  Widget get tranlate =>
      SvgPicture.asset(width: 30, height: 30, AppAssets.flagVi);

  Widget get tranlateFlag => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SvgPicture.asset(
          width: MediaQuery.of(context).size.width * 0.2,
          height: MediaQuery.of(context).size.height * 0.2,
          AppAssets.loginDecore04,
        ),
      );

  Widget get termAndPrivacyText => RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white)
              .copyWith(
                  color: AppColors.grayscale40,
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
          children: [
            TextSpan(
              text: ' By signing up you agree to our',
            ),
            TextSpan(
              text: ' Terms',
              style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white)
                  .copyWith(
                      color: AppColors.grayscaleDark100,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
            ),
            TextSpan(
              text: '  and',
              style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white)
                  .copyWith(
                      color: AppColors.grayscale40,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
            ),
            TextSpan(
              text: " Conditions of Use",
              style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white)
                  .copyWith(
                      color: AppColors.grayscaleDark100,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
            ),
          ],
        ),
      );
}
