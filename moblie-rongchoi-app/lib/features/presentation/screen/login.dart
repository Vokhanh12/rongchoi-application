import 'package:flutter/material.dart';
import 'package:rongchoi_application/core/config/app_dimensions.dart';
import 'package:rongchoi_application/core/config/app_typography.dart';
import 'package:rongchoi_application/core/config/space.dart';
import 'package:rongchoi_application/core/constants/assets.dart';
import 'package:rongchoi_application/core/validator/validator.dart';
import 'package:rongchoi_application/features/presentation/widgets/auth_screen_component.dart';
import 'package:rongchoi_application/features/presentation/widgets/custom_textformfield.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final Validators _validators = Validators();

  late FocusNode _usernameFocusNode;
  late FocusNode _passwordForcusNode;

  @override
  void initState() {
    // TODO: implement initState
    _usernameFocusNode = FocusNode();
    _passwordForcusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: EdgeInsets.only(top: AppDimensions.normalize(20)),
          child: Padding(
            padding: Space.hf(1.3),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  authTopColumn(false),
                  customTextFormField(
                      label: "Email Address*",
                      controller: _usernameController,
                      ),
                  Space.yf(1.3),
                  customTextFormField(
                      label: "Password*",
                      controller: _passwordController,
                      validator: _validators.validatePassword),
                  Space.yf(.3),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forgot Password?",
                      style: AppText.b2,
                    ),
                  ),
                  Space.yf(2.5),
                  // BlocConsumer<SignInBloc, SignInState>(
                  //   listener: (context, state) {
                  //     if (state.status == SignInStatus.error) {
                  //       showErrorAuthBottomSheet(context);
                  //     }
                  //     if (state.status == SignInStatus.success) {
                  //       showSuccessfulAuthBottomSheet(context, false);
                  //     }
                  //   },
                  //   builder: (context, state) {
                  //     return customElevatedButton(
                  //       onTap: () {
                  //         if (_formKey.currentState!.validate()) {
                  //           context.read<SignInBloc>().add(
                  //                 SignInWithCredential(
                  //                   email: _emailController.text.trim(),
                  //                   password: _passwordController.text.trim(),
                  //                 ),
                  //               );
                  //         }
                  //       },
                  //       text: (state.status == SignInStatus.submitting)
                  //           ? AppStrings.wait
                  //           : "Login".toUpperCase(),
                  //       heightFraction: 20,
                  //       width: double.infinity,
                  //       color: AppColors.commonAmber,
                  //     );
                  //   },
                  // ),
                  Space.yf(2.5),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: authBottomButton(false, () {
        //Navigator.of(context).pushNamed(AppRouter.signup);
      }),
    );
  }

}