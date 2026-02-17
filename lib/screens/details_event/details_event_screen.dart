import 'package:evently_app/screens/edit_event/edit_event_screen.dart';
import 'package:flutter/material.dart';
import 'package:evently_app/models/task_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DetailsEventScreen extends StatelessWidget {
  static const String routeName = "detailsEvent";

  const DetailsEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
     TaskModel? event =
        ModalRoute.of(context)?.settings.arguments as TaskModel?;

    if (event == null) {
      return Scaffold(
        backgroundColor: const Color(0xFFE8E8E8),
        appBar: AppBar(
          backgroundColor: const Color(0xFFE8E8E8),
          centerTitle: true,
          title: Text(
            "Event details",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        body: const Center(child: Text("No event data found")),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFE8E8E8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE8E8E8),
        centerTitle: true,
        title: Text(
          "Event details",
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: Image.asset("assets/images/edit.png", width: 20, height: 20),
            onPressed: () {
              Navigator.pushNamed(
                context,
                EditEventScreen.routeName,
                arguments: event,
              );
            },
          ),
          IconButton(
            icon: Image.asset(
              "assets/images/delete.png",
              width: 20,
              height: 20,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    "assets/images/${event.category}.png",
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                event.title,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.calendar_today_outlined,
                        color: Color(0xFF5669FF),
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat('dd MMMM').format(
                            DateTime.fromMillisecondsSinceEpoch(event.date),
                          ),
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          DateFormat('hh:mm a').format(
                            DateTime.fromMillisecondsSinceEpoch(event.date),
                          ),
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: const Color(0xFF747688),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Description",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  event.description,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Color(0xFF747688),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
