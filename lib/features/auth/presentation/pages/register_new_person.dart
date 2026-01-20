import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaktapp/core/constants/app_assets.dart';
import 'package:jaktapp/core/theme/app_colors.dart';
import 'package:jaktapp/core/widgets/button.dart';
import 'package:jaktapp/core/widgets/custom_text_field.dart';
import 'package:jaktapp/core/widgets/profile_header.dart';

import '../../../../core/utils/extensions.dart';

class RegisterNewPerson extends StatefulWidget {
  const RegisterNewPerson({super.key});

  @override
  State<RegisterNewPerson> createState() => _RegisterNewPersonState();
}

class _RegisterNewPersonState extends State<RegisterNewPerson> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _dobController = TextEditingController();
  String? _selectedGender;
  final List<String> _genders = ['Mann', 'Kvinne', 'Annet'];

  @override
  void dispose() {
    _nameController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  void _onRegisterNewPerson() {
    if (_formKey.currentState?.validate() ?? false) {
      // Implement registration logic
      print(
        "Navn: ${_nameController.text}, Kjønn: $_selectedGender, Født: ${_dobController.text}",
      );
    }
  }

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
                      "Ny person",
                      style: GoogleFonts.aleo(
                        fontSize: 28,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CustomTextField(
                      hintText: "Navn",
                      iconPath: AppAssets.iconPerson,
                      controller: _nameController,
                    ),
                    DropdownButtonFormField<String>(
                      value: _selectedGender,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Image.asset(
                            AppAssets.genderIcon,
                            width: 20,
                            height: 20,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Kjønn",
                        hintStyle: GoogleFonts.poppins(
                          color: AppColors.hintText,
                        ),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.hintText,
                      ),
                      items: _genders.map((gender) {
                        return DropdownMenuItem<String>(
                          value: gender,
                          child: Text(
                            gender,
                            style: GoogleFonts.poppins(
                              color: AppColors.hintText,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value;
                        });
                      },
                    ),
                    CustomTextField(
                      hintText: "Fødselsdato",
                      iconPath: AppAssets.calendarIcon,
                      controller: _dobController,
                    ),
                    CustomButton(
                      text: "Registrer",
                      btnIcon: AppAssets.iconRegistrer,
                      btnColor: AppColors.primaryBtnColor,
                      textColor: AppColors.white,
                      onPressed: _onRegisterNewPerson,
                    ),
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
