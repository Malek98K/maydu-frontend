import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_finance_guardian/l10n/generated/app_localizations.dart';
import 'otp_controller.dart';

class OtpPage extends ConsumerStatefulWidget {
  const OtpPage({super.key});

  @override
  ConsumerState<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends ConsumerState<OtpPage> {
  final _emailController = TextEditingController();
  final _tokenController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _tokenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(otpControllerProvider);
    final l10n = AppLocalizations.of(context)!;
    final isLoading = state is AsyncLoading;
    final isOtpSent = state.value ?? false;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.otpTitle)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (state is AsyncError)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      l10n.errorGeneric,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                if (!isOtpSent) ...[
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: l10n.otpEmailLabel),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => value!.isEmpty ? 'Required' : null,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              ref.read(otpControllerProvider.notifier).sendOtp(_emailController.text.trim());
                            }
                          },
                    child: isLoading ? const CircularProgressIndicator() : Text(l10n.otpSendButton),
                  ),
                ] else ...[
                  TextFormField(
                    controller: _tokenController,
                    decoration: InputDecoration(labelText: l10n.otpCodeLabel),
                    keyboardType: TextInputType.number,
                    validator: (value) => value!.isEmpty ? 'Required' : null,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              ref.read(otpControllerProvider.notifier).verifyOtp(
                                    _emailController.text.trim(),
                                    _tokenController.text.trim(),
                                  );
                            }
                          },
                    child: isLoading ? const CircularProgressIndicator() : Text(l10n.otpVerifyButton),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
