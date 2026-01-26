import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaktapp/core/constants/app_assets.dart';
import 'package:jaktapp/core/theme/app_colors.dart';
import 'package:jaktapp/core/utils/extensions.dart';

import 'package:jaktapp/core/widgets/button.dart';
import 'package:jaktapp/core/widgets/custom_text_field.dart';
import 'package:jaktapp/core/widgets/profile_header.dart';

class UpdateUser extends StatefulWidget {
  const UpdateUser({super.key});

 @override
  State <UpdateUser> createState() => _UpdateUser();
}
 
class _UpdateUser extends State<UpdateUser> {

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

 
  @override
  Widget build(BuildContext context) {

    final headerHeight = context.height * 0.20; 
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileHeader(
              height: headerHeight,
              logoBottomOffset: context.height * 0.04,
            ),
             Padding(
              padding: const EdgeInsets.all(30),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 30,
                  children: [
                       Text(
                      "Oppdater bruker",
                      style: GoogleFonts.aleo(
                        fontSize: 28,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CustomTextField(hintText: "Kari Nordmann", iconPath: AppAssets.iconPerson,  controller: _nameController,color: AppColors.white,),
                    CustomTextField(hintText: "Kari@eksempel.no",iconPath: AppAssets.iconEmail, controller: _emailController,color: AppColors.greyWhite, showEditIcon: true),
                    CustomTextField(hintText: "111 11 111",iconPath: AppAssets.iconTelefon, controller: _phoneController, color: AppColors.greyWhite,showEditIcon: true),
                    CustomTextField(hintText: "736475",iconPath: AppAssets.iconPassword, controller: _passwordController, color:AppColors.greyWhite, obscureText: true,keyboardType: TextInputType.visiblePassword,showEditIcon: true),
                    CustomButton(text: "Lagre", btnIcon: AppAssets.iconRegistrer, onPressed: () {}, btnColor: AppColors.primaryBtnColor, textColor: AppColors.white)

               ],
                ),
              ),
             ),
          ],
        ),
      ),
    );
  }
}
