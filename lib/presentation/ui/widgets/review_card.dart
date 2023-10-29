import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.name,
    required this.comment,
  });

  final String name;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: ListTile(
          // contentPadding: EdgeInsets.all(8),
          title: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person_outlined,
                  color: Colors.black54,
                  size: 20,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          subtitle: Text(
            comment,
          ),
        ),
      ),
    );
  }
}
