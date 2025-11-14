import 'package:boredom/resources/colors.dart';
import 'package:boredom/resources/styles.dart';
import 'package:boredom/widgets/clickables.dart';
import 'package:flutter/material.dart';
import '../models/activity.dart';
import '../services/api_service.dart';
import 'package:shimmer/shimmer.dart';

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
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        leadingWidth: 70,
        titleSpacing: -2,
        toolbarHeight: 60,
        iconTheme: IconThemeData(color: AppColors.buttonText, size: 30),
        title: const Text("Activity", style: AppStyles.screenTitle),
        backgroundColor: AppColors.secondary,
      ),
      body: Center(
        child: loading
            ? const CircularProgressIndicator()
            : activity == null
            ? const Text("No activity found")
            : Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Card(
                        margin: EdgeInsets.zero,
                        color: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              imageUrl == null
                                  ? Shimmer.fromColors(
                                      baseColor: Colors.grey.shade300,
                                      highlightColor: Colors.grey.shade100,
                                      child: Container(
                                        height: 275,
                                        width: 275,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                        ),
                                      ),
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.network(
                                        imageUrl!,
                                        height: 275,
                                        width: 275,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                              const SizedBox(height: 20),
                              Text(
                                activity!.activity,
                                textAlign: TextAlign.center,
                                style: AppStyles.title,
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  clickableChip(
                                    text:
                                        activity!.type[0].toUpperCase() +
                                        activity!.type.substring(1),
                                    onTap: () {},
                                  ),
                                  const SizedBox(width: 20),
                                  clickableChip(
                                    text: "${activity!.participants}",
                                    icon: activity!.participants == 1
                                        ? Icons.person
                                        : Icons.people,
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 2, right: 20),
                            child: actionButton(
                              text: 'Next',
                              onPressed: fetchActivity,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 2,
                            vertical: 24,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: AppColors.tertiary!,
                                width: 2,
                              ),
                            ),
                            padding: EdgeInsets.all(14),
                            child: Icon(
                              Icons.share_outlined,
                              size: 28,
                              color: AppColors.tertiary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
