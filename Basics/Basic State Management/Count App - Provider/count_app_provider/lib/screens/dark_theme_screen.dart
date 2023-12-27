import 'package:count_app_provider/provider/theme_changer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DarkThemeScreen extends StatefulWidget {
  const DarkThemeScreen({super.key});

  @override
  State<DarkThemeScreen> createState() => _DarkThemeScreenState();
}

class _DarkThemeScreenState extends State<DarkThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChangerProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Changer"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              title: const Text(
                "Choose a Theme",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            buildThemeTile(
              title: "Light Mode",
              themeMode: ThemeMode.light,
              themeChanger: themeChanger,
              icon: Icons.wb_sunny,
              color: Colors.orange,
            ),
            const SizedBox(height: 8),
            buildThemeTile(
              title: "Dark Mode",
              themeMode: ThemeMode.dark,
              themeChanger: themeChanger,
              icon: Icons.nightlight_round,
              color: Colors.blueGrey,
            ),
            const SizedBox(height: 8),
            buildThemeTile(
              title: "System Mode",
              themeMode: ThemeMode.system,
              themeChanger: themeChanger,
              icon: Icons.settings,
              color: Colors.indigo,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildThemeTile({
    required String title,
    required ThemeMode themeMode,
    required ThemeChangerProvider themeChanger,
    required IconData icon,
    required Color color,
  }) {
    return InkWell(
      onTap: () => themeChanger.setTheme(themeMode),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon,
                size: 40,
                color: Colors.white,
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              Radio<ThemeMode>(
                value: themeMode,
                groupValue: themeChanger.themeMode,
                onChanged: (value) => themeChanger.setTheme(value!),
                activeColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
