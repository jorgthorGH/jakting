import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaktapp/core/constants/app_assets.dart';
import 'package:jaktapp/core/theme/app_colors.dart';
import 'package:jaktapp/core/widgets/auth_header.dart';
import 'package:jaktapp/core/widgets/bottom_card.dart';
import 'package:jaktapp/core/widgets/custom_button.dart';
import 'package:jaktapp/core/widgets/custom_text_field.dart';
import 'package:jaktapp/features/auth/presentation/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _hideFromStatistics = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onRegister() {
    if (_formKey.currentState?.validate() ?? false) {
      // TODO: Implement registration logic
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuthHeader(),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 30,
                  children: [
                    Text(
                      "Registrer deg",
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
                    CustomTextField(
                      hintText: "E-post",
                      iconPath: AppAssets.iconEmail,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    CustomTextField(
                      hintText: "Telefon",
                      iconPath: AppAssets.iconTelefon,
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                    ),
                    CustomTextField(
                      hintText: "Passord",
                      iconPath: AppAssets.iconPassword,
                      obscureText: true,
                      controller: _passwordController,
                    ),
                    CustomTextField(
                      hintText: "Passord",
                      iconPath: AppAssets.iconPassword,
                      obscureText: true,
                      smallText: "(gjenta)",
                      controller: _confirmPasswordController,
                    ),
                    _buildStatisticsCheckbox(),
                    CustomButton(
                      text: "Registrer",
                      btnIcon: AppAssets.iconRegistrer,
                      btnColor: AppColors.primaryBtnColor,
                      textColor: AppColors.white,
                      onPressed: _onRegister,
                    ),
                    BottomCard(
                      descriptionText: "Har du en konto",
                      buttonText: "Logg inn",
                      btnIcon: AppAssets.iconLoginScn,
                      onPressed: () {
                     
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage())
                          );
                      },
                      btnColor: AppColors.secondaryBtnColor,
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

  Widget _buildStatisticsCheckbox() {
    return GestureDetector(
      onTap: () => setState(() => _hideFromStatistics = !_hideFromStatistics),
      child: Row(
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: _hideFromStatistics,
              onChanged: (value) {
                setState(() => _hideFromStatistics = value ?? false);
              },
              side: const BorderSide(color: AppColors.white),
              checkColor: AppColors.white,
              fillColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return AppColors.checkColor;
                }
                return AppColors.white;
              }),
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              "Jeg ønsker ikke å bli vist i offentlige statistikker",
              style: GoogleFonts.aleo(
                fontSize: 14,
                decoration: TextDecoration.underline,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
