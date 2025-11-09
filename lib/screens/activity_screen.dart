import 'package:boredom/resources/colors.dart';
import 'package:boredom/resources/styles.dart';
import 'package:flutter/material.dart';
import '../models/activity.dart';
import '../services/api_service.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  Activity? activity;
  bool loading = false;
  String? imageUrl;

  void loadImage() async {
    final img = await ApiService.fetchImageFromWikimedia(activity!.activity);
    setState(() => imageUrl = img);
  }

  Future<void> fetchActivity() async {
    setState(() => loading = true);
    final res = await ApiService.getActivity();
    setState(() {
      activity = res;
      loading = false;
    });
    if (activity != null) loadImage(); // 👈 call here
  }

  @override
  void initState() {
    super.initState();
    fetchActivity(); // only this
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text("Activity")),
      body: Center(
        child: loading
            ? const CircularProgressIndicator()
            : activity == null
            ? const Text("No activity found")
            : Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (activity != null) ...[
                      imageUrl == null
                          ? const CircularProgressIndicator()
                          : Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 6,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  imageUrl!,
                                  height: 200,
                                  width: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                      const SizedBox(height: 40),
                      Text(
                        activity!.activity,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                    const SizedBox(height: 20),
                    Text(
                      "Type: ${activity!.type}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Participants: ${activity!.participants}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: fetchActivity,
                      style: AppStyles.primaryButton,
                      child: const Text(
                        "Find Another Activity",
                        style: AppStyles.buttonText,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
