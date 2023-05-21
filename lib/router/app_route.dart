import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:qwise/auth/on_boarding_screen.dart/on_boarding_screen.dart';
import 'package:qwise/auth/password/create_new_password.dart';
import 'package:qwise/auth/password/forgot_password.dart';
import 'package:qwise/auth/password/verify_otp_screen.dart';
import 'package:qwise/auth/sign_in/sign_in.dart';
import 'package:qwise/auth/signup/signup_screen.dart';
import 'package:qwise/home/home_screen.dart';
import 'package:qwise/home/main_screen.dart';
import 'package:qwise/router/routes_names.dart';

import '../auth/password/password_updated_success.dart';
import '../home/course_category/course_category.dart';

final appRoute = GoRouter(
    initialLocation: FirebaseAuth.instance.currentUser != null
        ? RouteNames.main
        : RouteNames.onBoarding,
    routes: [
      GoRoute(
        path: RouteNames.onBoarding,
        name: RouteNames.onBoarding,
        builder: (context, state) {
          return const OnBoarding();
        },
      ),
      GoRoute(
        path: RouteNames.signUpScreen,
        name: RouteNames.signUpScreen,
        builder: (context, state) {
          return const SignUpScreen();
        },
      ),
      GoRoute(
        path: RouteNames.signInScreen,
        name: RouteNames.signInScreen,
        builder: (context, state) {
          return const SignInScreen();
        },
      ),
      GoRoute(
        path: RouteNames.forgotPasswordScreen,
        name: RouteNames.forgotPasswordScreen,
        builder: (context, state) {
          return const ForgotPasswordScreen();
        },
      ),
      GoRoute(
        path: RouteNames.verifyOTPScreen,
        name: RouteNames.verifyOTPScreen,
        builder: (context, state) {
          return const VerifyOtpScreen();
        },
      ),
      GoRoute(
        path: RouteNames.createNewPassword,
        name: RouteNames.createNewPassword,
        builder: (context, state) {
          return const CreateNewPassword();
        },
      ),
      GoRoute(
        path: RouteNames.updatedPasswordSuccess,
        name: RouteNames.updatedPasswordSuccess,
        builder: (context, state) {
          return const PasswordUpdatedSuccessfullyScreen();
        },
      ),
      GoRoute(
        path: RouteNames.main,
        name: RouteNames.main,
        builder: (context, state) {
          return const MainScreen();
        },
      ),
      GoRoute(
        path: RouteNames.home,
        name: RouteNames.home,
        builder: (context, state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: RouteNames.courseCategory,
        name: RouteNames.courseCategory,
        builder: (context, state) {
          return const CourseCategory();
        },
      ),
    ]);
