// ignore_for_file: unrelated_type_equality_checks

import 'package:go_router/go_router.dart';
import 'package:qwise/auth/on_boarding_screen.dart/on_boarding_screen.dart';
import 'package:qwise/auth/password/create_new_password.dart';
import 'package:qwise/auth/password/forgot_password.dart';
import 'package:qwise/auth/password/verify_otp_screen.dart';
import 'package:qwise/auth/sign_in/sign_in.dart';
import 'package:qwise/auth/signup/signup_screen.dart';
import 'package:qwise/home/home_screen.dart';
import 'package:qwise/home/main_screen.dart';
import 'package:qwise/home/notification/notification.dart';
import 'package:qwise/home/recommended_courses/course_view_screen.dart';
import 'package:qwise/profile/edit_profile.dart';
import 'package:qwise/profile/help.dart';
import 'package:qwise/router/routes_names.dart';
import 'package:qwise/search/course_search_screen.dart';

import '../admin/admin_routes.dart';
import '../auth/password/password_updated_success.dart';
import '../home/course_category/course_category.dart';
import '../home/recommended_courses/course_details/course_details.dart';
import '../local/pref_names.dart';
import '../privacy_policy.dart';

//bool isUserLogin = Prefs.getBool(PrefNames.isLogin) ?? false;

String getInitialRoute() {
  if (PrefNames.isLogin == 'isLogin') {
    return RouteNames.main;
  } else {
    return RouteNames.onBoarding;
  }

  // switch (isUserLogin) {
  //   case false:
  //     return RouteNames.onBoarding;
  //   default:
  //     return RouteNames.main;
  // }
}

final appRoute = GoRouter(initialLocation: getInitialRoute(), routes: [
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
      //   Prefs.setValue(PrefNames.isLogin, 'true');
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
  GoRoute(
    path: RouteNames.profileEdit,
    name: RouteNames.profileEdit,
    builder: (context, state) {
      return const EditProfile();
    },
  ),
  GoRoute(
    path: RouteNames.courseView,
    name: RouteNames.courseView,
    builder: (context, state) {
      return const CourseView();
    },
  ),
  GoRoute(
    path: RouteNames.courseDetails,
    name: RouteNames.courseDetails,
    builder: (context, state) {
      final String courseId = state.queryParameters['courseId'] ?? '';
      return CourseDetails(
        courseId: courseId,
      );
    },
  ),
  GoRoute(
    path: RouteNames.searchCourse,
    name: RouteNames.searchCourse,
    builder: (context, state) {
      return const CourseSearchScreen();
    },
  ),
  GoRoute(
    path: RouteNames.bellNotification,
    name: RouteNames.bellNotification,
    builder: (context, state) {
      return const NotificationScreen();
    },
  ),
  GoRoute(
    path: RouteNames.helpSupport,
    name: RouteNames.helpSupport,
    builder: (context, state) {
      return const HelpSupport();
    },
  ),
  GoRoute(
    path: RouteNames.privacyPolicy,
    builder: (context, state) {
      return const PrivacyScreen();
    },
  ),
  ...adminRoutes,
]);
