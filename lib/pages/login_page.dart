import 'package:hfa/constants/image_constants.dart';
import 'package:hfa/controllers/authentication_controller.dart';
import 'package:hfa/pages/weblink_page.dart';
import 'package:hfa/pages/student_dashboard_page.dart';
import 'package:hfa/pages/registration_page.dart';
import 'package:hfa/pages/teacher_dashboard_page.dart';
import 'package:hfa/utils/app_bindings.dart';
import 'package:hfa/utils/globals.dart';
import 'package:hfa/widgets/process_handler.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../controllers/course_controller.dart';
import '../../widgets/animated_image.dart';
import '../../widgets/logo.dart';
import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Text Controllers
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // Focus Nodes to differentiate between active and in-active fields.
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  // Form Key to validate User Input.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isVisible = true;

  @override
  void initState() {
    // For Development purpose.
    if (kDebugMode) {
      _emailController = TextEditingController(text: '');
      _passwordController = TextEditingController(text: '');
    }

    _emailFocusNode.addListener(() => _onFocusChange());
    _passwordFocusNode.addListener(() => _onFocusChange());
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      // Process Handler to handle the UI processing
      // This also handles the Error Logic as well.
      ProcessHandler<AuthenticationController>(
        processTitle: 'Logging In...',
        child: AnnotatedRegion(
          value: SystemUiOverlayStyle.dark,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // SizedBox(
                    //   height: sizeConfig.height(.15),
                    // ),
                    Container(
                      margin: EdgeInsets.only(
                        top: sizeConfig.safeArea.top + sizeConfig.height(.02),
                        left: sizeConfig.width(.08),
                      ),
                      alignment: Alignment.topLeft,
                      child: Hero(
                        tag: 'canPop',
                        child: Material(
                          type: MaterialType.transparency,
                          child: IconButton(
                            icon: const Icon(
                              Icons.close,
                              size: 28,
                            ),
                            color: Theme.of(context).colorScheme.primary,
                            onPressed: _goToWebLinkPage,
                          ),
                        ),
                      ),
                    ),
                    const Hero(
                      tag: 'logo',
                      child: Logo(),
                    ),
                    SizedBox(
                      height: sizeConfig.height(.06),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: sizeConfig.height(.005),
                      ),
                      child: Text(
                        'Welcome Back!',
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                      ),
                    ),
                    Text(
                      'Login to your existing account',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: Colors.black,
                          ),
                    ),
                    AnimatedContainer(
                      margin: EdgeInsets.only(
                        top: sizeConfig.height(.03),
                        right: sizeConfig.width(.05),
                        left: sizeConfig.width(.05),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      duration: Duration.zero,
                      child: TextFormField(
                        controller: _emailController,
                        focusNode: _emailFocusNode,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          fillColor: _emailFocusNode.hasFocus
                              ? Colors.transparent
                              : const Color(0XFFF2F5F7),
                          suffixIcon: kDebugMode
                              ? InkWell(
                                  onTap: () {
                                    if (_emailController.text.contains('')) {
                                      _emailController.text = '';
                                    } else {
                                      _emailController.text = '';
                                    }
                                    setState(() {});
                                  },
                                  child:
                                      const Icon(Icons.change_circle_outlined),
                                )
                              : null,
                          prefixIcon: AnimatedImage(
                            imagePath: ImageConstants.user,
                            focusNode: _emailFocusNode,
                          ),
                        ),
                        validator: (String? input) =>
                            input == null || input.isEmpty
                                ? "Please enter your email address."
                                : input.trim().contains(
                                          RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"),
                                        )
                                    ? null
                                    : "Please enter a valid email address.",
                      ),
                    ),
                    StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) =>
                          AnimatedContainer(
                        margin: EdgeInsets.only(
                          top: sizeConfig.height(.03),
                          right: sizeConfig.width(.05),
                          left: sizeConfig.width(.05),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        duration: Duration.zero,
                        child: TextFormField(
                          controller: _passwordController,
                          focusNode: _passwordFocusNode,
                          obscureText: _isVisible,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            fillColor: _passwordFocusNode.hasFocus
                                ? Colors.transparent
                                : const Color(0XFFF2F5F7),
                            suffixIcon: InkWell(
                              child: AnimatedImage(
                                  imagePath: _isVisible
                                      ? ImageConstants.inVisible
                                      : ImageConstants.visible,
                                  focusNode: _passwordFocusNode),
                              onTap: () =>
                                  setState(() => _isVisible = !_isVisible),
                            ),
                            prefixIcon: AnimatedImage(
                              imagePath: ImageConstants.password,
                              focusNode: _passwordFocusNode,
                            ),
                          ),
                          validator: (String? input) =>
                              input == null || input.isEmpty
                                  ? "Please enter your password."
                                  : null,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: sizeConfig.width(.03),
                      ),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: _goToForgotPassword,
                          child: const Text('Forgot Password'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: sizeConfig.height(.02),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: sizeConfig.width(.05),
                      ),
                      child: ElevatedButton(
                        onPressed: _login,
                        child: const Text(
                          'LOGIN',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: sizeConfig.height(.03),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Don’t have an account?',
                        style: Theme.of(context).textTheme.bodyText1,
                        children: [
                          TextSpan(
                            text: ' Sign up',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.to(
                                    () => const RegistrationPage(),
                                  ),
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withOpacity(.8),
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  /// Functions
  void _login() async {
    if (_formKey.currentState!.validate()) {
      bool success = await Get.find<AuthenticationController>()
          .login(_emailController.text.trim(), _passwordController.text);
      if (success) {
        // after login load the courses of specific user.
        appUser.role == Role.student
            ? Get.find<CourseController>().loadStudentSemesters()
            : Get.find<CourseController>().loadTeacherAssignedCourses();
        Get.offAll(
          () => appUser.role == Role.student
              ? const StudentDashboardPage()
              : const TeacherDashboardPage(),
          binding: appUser.role == Role.student
              ? StudentDashboardBinding()
              : TeacherDashboardBinding(),
        );
      }
    }
  }

  void _onFocusChange() => setState(() {});

  void _goToForgotPassword() {
    Get.to(
      () => const ForgotPasswordPage(),
    );
  }

  void _goToWebLinkPage() {
    final bool? canPop = Get.routing.route?.navigator?.canPop();
    if (canPop == false || canPop == null) {
      Get.to(
        () => const WebLinkPage(),
      );
    } else {
      Get.back();
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }
}
