import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../auth/data/auth_repository.dart';
import 'package:student_finance_guardian/l10n/generated/app_localizations.dart';

class ProfileSettingsPage extends ConsumerWidget {
  const ProfileSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.profileTitle),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.security),
            title: Text(l10n.profileSecuritySettings),
            subtitle: Text(l10n.profileSecuritySubtitle),
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: Text(l10n.profileLogout, style: const TextStyle(color: Colors.red)),
            onTap: () async {
              // OWASP SCP: Ensure secure session termination
              await ref.read(authRepositoryProvider).signOut();
            },
          ),
        ],
      ),
    );
  }
}
