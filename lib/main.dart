import 'package:flutter/material.dart';

void main() {
  runApp(const PrayerTimesApp());
}

class PrayerTimesApp extends StatelessWidget {
  const PrayerTimesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            // 🔹 صورة دينية كخلفية
            Positioned.fill(
              child: Image.asset(
                'assets/background.jpg', // استبدلها بصورتك الدينية
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const Text(
                  "مواقيت الصلاة",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      // 🔹 الصلاة القادمة
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "الصلاة القادمة",
                              style: TextStyle(fontSize: 18, color: Colors.black),
                            ),
                            Text(
                              "المغرب  |  18:20",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      // 🔹 أوقات الصلاة
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 3,
                        children: const [
                          PrayerTimeTile(title: "الفجر", time: "05:37"),
                          PrayerTimeTile(title: "الشروق", time: "07:12"),
                          PrayerTimeTile(title: "الظهر", time: "12:49"),
                          PrayerTimeTile(title: "العصر", time: "15:41"),
                          PrayerTimeTile(title: "المغرب", time: "18:20"),
                          PrayerTimeTile(title: "العشاء", time: "19:39"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// 🔹 تصميم كل مربع وقت صلاة
class PrayerTimeTile extends StatelessWidget {
  final String title;
  final String time;

  const PrayerTimeTile({super.key, required this.title, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Text(time, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
