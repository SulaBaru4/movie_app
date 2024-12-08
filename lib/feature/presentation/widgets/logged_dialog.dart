import 'package:application_pet/feature/presentation/bloc/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/colors.dart';

void showLoggedDialog(BuildContext context, String? email) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("You are already logged in", style: TextStyle(fontSize: 20),),
      content: Text("You logged in as $email. \n Do you want to log out?"),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.pink,
            shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
  ),
          ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel', style: TextStyle(color: Colors.white),),),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.pink,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
          context.read<AuthCubit>().signOut();
          Navigator.pop(context);
        }, child: Text("Log out",style: TextStyle(color: Colors.white),))
      ],
    ),
  );
}
