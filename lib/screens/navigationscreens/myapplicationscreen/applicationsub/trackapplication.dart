import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ApplicationTrackingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Applied School Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // University Info
            const Text(
              'University of Wolverhampton',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text('📍 Brussels, Belgium.'),
            const SizedBox(height: 4),
            const Text(
              'Application ID: 698094554317',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            const Text(
              '17 Sep 2023 11:21 AM',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            // Track Application Section
            const Text(
              'Track Application',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Timeline
            Expanded(
              child: ListView(
                children: [
                  _buildTimelineItem(
                    title: 'Offer letter',
                    subtitle: 'Not yet',
                    isCompleted: false,
                    icon: Iconsax.cup,
                    islast: false,
                  ),
                  _buildTimelineItem(
                    title: 'Team matching',
                    subtitle: '29/06/22 02:00 pm',
                    isCompleted: true,
                    islast: false,
                  ),
                  _buildTimelineItem(
                    title: 'Final HR interview',
                    subtitle: '21/06/22 04:00 pm',
                    isCompleted: true,
                    islast: false,
                  ),
                  _buildTimelineItem(
                    title: 'Technical interview',
                    subtitle: '12/06/22 10:00 am',
                    isCompleted: true,
                    islast: false,
                  ),
                  _buildTimelineItem(
                    title: 'Screening interview',
                    subtitle: '05/06/22 11:00 am',
                    isCompleted: true,
                    islast: false,
                  ),
                  _buildTimelineItem(
                    title: 'Reviewed by Spotify team',
                    subtitle: '25/05/22 09:00 am',
                    isCompleted: true,
                    islast: false,
                  ),
                  _buildTimelineItem(
                    title: 'Application submitted',
                    subtitle: '17/05/22 11:00 am',
                    isCompleted: true,
                    islast: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineItem({
    required String title,
    required String subtitle,
    required bool isCompleted,
    required bool islast,
    IconData? icon,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline Indicator
        Column(
          children: [
            Icon(
              icon = isCompleted
                  ? (icon ?? Icons.check_circle_rounded)
                  : (icon ?? Icons.radio_button_unchecked),
              color: isCompleted ? Colors.green : Colors.grey,
              size: 30,
            ),
            if (!islast)
              Container(
                width: 2,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.grey,
                  borderRadius: BorderRadius.circular(41)
                ),
              ),
          ],
        ),
        const SizedBox(width: 16),
        // Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isCompleted ? Colors.black : Colors.grey,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}
