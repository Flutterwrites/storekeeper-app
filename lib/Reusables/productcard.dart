// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:flutter/material.dart';

class Productcard extends StatelessWidget {
  const Productcard({
    super.key,
    required this.myText,
    required this.myImage,
    required this.myPrice,
    required this.myQuantity,
    required this.onEdit,
    required this.onDelete,
    this.isFromFile = false,
  });

  final String myText;
  final String myImage;
  final String myPrice;
  final String myQuantity;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final bool isFromFile;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 164,
      height: 245,
      decoration: BoxDecoration(
        color: const Color(0xFF4392F9).withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isFromFile
                    ? Image.file(
                        File(myImage),
                        height: 95,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        myImage,
                        height: 95,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                const SizedBox(height: 4),
                Text(
                  myText,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Quantity: $myQuantity',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  myPrice,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: 4,
            right: 4,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.black, size: 25),
                  onPressed: onEdit,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.black, size: 25),
                  onPressed: onDelete,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
