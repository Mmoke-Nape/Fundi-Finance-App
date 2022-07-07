import 'package:email_validator/email_validator.dart';
import 'package:finance_app/widgets/navAppbar/navAppbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_routes.dart';
import '../../constants/constants.dart';
import '../../widgets/custom_button.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final countryController = TextEditingController();
  final numberController = TextEditingController();
  final genderController = TextEditingController();

  String? selectedValue = null;
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    countryController.dispose();
    numberController.dispose();
    genderController.dispose();

    super.dispose();
  }

  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("USA"), value: "USA"),
    DropdownMenuItem(child: Text("Canada"), value: "Canada"),
    DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
    DropdownMenuItem(child: Text("England"), value: "England"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.light,
        floatingActionButton: Container(
          margin: const EdgeInsets.only(left: 30),
          child: CustomAppButton(
            text: 'Save changes', press: () {},
            //  () {
            //   Get.toNamed(AppRoutes.verifyRoute);
            // },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              NavAppBar(
                text: 'Your profile',
                press: () {},
              ),
              const SizedBox(height: 20),
              const CircleAvatar(
                radius: 50,
                foregroundImage: AssetImage('assets/images/me/me.jpg'),
              ),
              const SizedBox(height: 10),
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: addressController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          focusColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintStyle: const TextStyle(color: Colors.grey),
                          hintText: 'Full Name',
                          prefixIcon: const Icon(
                            Icons.person_outlined,
                            color: AppColors.orange,
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                        keyboardType: TextInputType.name,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        // validator: (email) =>
                        //     email != null && !EmailValidator.validate(email)
                        //         ? 'Enter a valid email'
                        //         : null,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          focusColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintStyle: const TextStyle(color: Colors.grey),
                          hintText: 'Email',
                          prefixIcon: const Icon(
                            Icons.email,
                            color: AppColors.orange,
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                        keyboardType: TextInputType.emailAddress,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (email) =>
                            email != null && !EmailValidator.validate(email)
                                ? 'Enter a valid email'
                                : null,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: addressController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          focusColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintStyle: const TextStyle(color: Colors.grey),
                          hintText: 'Address',
                          prefixIcon: const Icon(
                            Icons.edit_location_alt_outlined,
                            color: AppColors.orange,
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                        keyboardType: TextInputType.streetAddress,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        // validator: (email) =>
                        //     email != null && !EmailValidator.validate(email)
                        //         ? 'Enter a valid email'
                        //         : null,
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 60,
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.flag,
                              color: AppColors.orange,
                            ),
                            hintStyle: const TextStyle(color: Colors.grey),
                            hintText: 'Country',
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            focusColor: Colors.white,
                          ),
                          validator: (value) =>
                              value == null ? "Select a country" : null,
                          dropdownColor: AppColors.peach,
                          value: selectedValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedValue = newValue!;
                            });
                          },
                          items: menuItems,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: numberController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          focusColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintStyle: const TextStyle(color: Colors.grey),
                          hintText: 'Phone number',
                          prefixIcon: const Icon(
                            Icons.phone,
                            color: AppColors.orange,
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                        keyboardType: TextInputType.number,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        // validator: (email) =>
                        //     email != null && !EmailValidator.validate(email)
                        //         ? 'Enter a valid email'
                        //         : null,
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 60,
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.man_rounded,
                              color: AppColors.orange,
                            ),
                            hintStyle: const TextStyle(color: Colors.grey),
                            hintText: 'Gender',
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            focusColor: Colors.white,
                          ),
                          validator: (value) =>
                              value == null ? "Select a country" : null,
                          dropdownColor: AppColors.peach,
                          value: selectedValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedValue = newValue!;
                            });
                          },
                          items: menuItems,
                        ),
                      ),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
