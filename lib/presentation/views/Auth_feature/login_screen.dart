import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/auth_provider.dart';
import 'widgets/customtextfield.dart';



class LoginScreen extends StatelessWidget {
   const LoginScreen({super.key});





  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.lock, size: 80, color: Colors.blue),
              const SizedBox(height: 20),
              const Text("Login", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTextField(controller: authProvider.emailController, hintText: "Email", isPassword: false),
                    const SizedBox(height: 15),
                    CustomTextField(controller: authProvider.passwordController, hintText: "Password", isPassword: true),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed:authProvider.isLoading
                            ? null
                            : () async{
                          if (formKey.currentState!.validate()) {
                            print(authProvider.emailController.text);
                            print(authProvider.passwordController.text);
                      await  authProvider.login(authProvider.emailController.text,
                            authProvider.passwordController.text, context);
                          }
                        },
                        child: authProvider.isLoading
                            ? const CircularProgressIndicator(color: Colors.white)
                            : const Text("Login"),
                      ),
                    ),
                  if (authProvider.errorMessage != null)
            Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(authProvider.errorMessage!, style: const TextStyle(color: Colors.red)),
      )
                //    else if((authProvider.errorMessage == null)&&(authProvider.message!=null))

                     // Text(authProvider.message!, style: const TextStyle(color: Colors.green)),
                                //navigato to anotherscreen
                  //    Navigator.push(context, route)


                                //authProvider.login(authProvider.emailController.text,
                               // authProvider.passwordController.text),
                      //  child: const Text("Login"),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

