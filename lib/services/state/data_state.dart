import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:part_website/services/firebase/firebase_services.dart';
import 'package:part_website/services/state/navigation_state.dart';
import '../../global/enum.dart';

final userProvider =
    StateNotifierProvider<UserProvider, User?>((ref) => UserProvider());

class UserProvider extends StateNotifier<User?> {
  UserProvider() : super(null) {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      state = user;
    });
  }

  void login(
      {required String email,
      required String password,
      required BuildContext context,
      required WidgetRef ref}) async {
    ref.read(authLoadingProvider.notifier).state = true;
    final map = await FirebaseApi.login(email, password);
    if (map['message'] == 'success') {
      state = map['user'];
      ref.read(authLoadingProvider.notifier).state = false;
      if (mounted) {
        ref.read(homeNavigationProvider.notifier).state = Pages.home;
        AutoRouter.of(context).pushNamed('/');
      }
    } else {
      ref.read(authLoadingProvider.notifier).state = false;
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(map['message']),
          ),
        );
      }
    }
  }

  void googleLogin({required BuildContext context, required WidgetRef ref}) {
    ref.read(authLoadingProvider.notifier).state = true;
    FirebaseApi.signInWithGoogle().then((map) {
      if (map['message'] == 'success') {
        state = map['user'];
        ref.read(authLoadingProvider.notifier).state = false;
        if (mounted) {
          ref.read(homeNavigationProvider.notifier).state = Pages.home;
          AutoRouter.of(context).pushNamed('/');
        }
      } else {
        ref.read(authLoadingProvider.notifier).state = false;
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(map['message']),
            ),
          );
        }
      }
    }).onError((error, stackTrace) {
      ref.read(authLoadingProvider.notifier).state = false;
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.toString()),
          ),
        );
      }
    });
  }
}

final authLoadingProvider = StateProvider<bool>((ref) => false);
