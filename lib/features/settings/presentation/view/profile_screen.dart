import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:vexa/app/constants/strings.dart';

class ProfileScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileBloc()..add(LoadProfile()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.profile),
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProfileLoaded || state is ProfileUpdated) {
              final name = (state is ProfileLoaded) ? state.name : (state as ProfileUpdated).name;
              final email = (state is ProfileLoaded) ? state.email : (state as ProfileUpdated).email;

              nameController.text = name;
              emailController.text = email;

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: AppStrings.nameLabel,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: AppStrings.emailLabel,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 32),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<ProfileBloc>().add(
                            UpdateProfile(
                              name: nameController.text,
                              email: emailController.text,
                            ),
                          );
                        },
                        child: Text(AppStrings.updateProfileButton),
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is ProfileError) {
              return Center(child: Text(state.errorMessage));
            }

            return Center(child: Text(AppStrings.genericErrorMessage));
          },
        ),
      ),
    );
  }
}
