import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:sign_bridge/utils/colors.dart';

class ElementScreen extends StatefulWidget {
  final List<String> ls;
  final String title;

  const ElementScreen({super.key, required this.ls, required this.title});

  @override
  State<ElementScreen> createState() => _ElementScreenState();
}

class _ElementScreenState extends State<ElementScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            // Title with Gradient Effect
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [Colors.blueAccent, Colors.purpleAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds);
              },
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30.0),

            // Parallax Carousel
            Expanded(
              child: CarouselSlider.builder(
                itemCount: widget.ls.length,
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.6,
                  viewportFraction: 0.75,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  enableInfiniteScroll: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                itemBuilder: (context, index, realIndex) {
                  return Stack(
                    children: [
                      // Background Image with Parallax Effect
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Stack(
                            children: [
                              Image.network(
                                widget.ls[index],
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                              // Gradient Overlay
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.black.withOpacity(0.3),
                                      Colors.transparent
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                              ),
                              // Slide Number with Glass Effect
                              Positioned(
                                bottom: 20,
                                left: 20,
                                right: 20,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 10, sigmaY: 10),
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Text(
                                        'Slide ${index + 1}',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            const SizedBox(height: 10.0),

            // Indicator Dots with Neumorphism Effect
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.ls.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: _currentIndex == index ? 6.0 : 4.0,
                  height: _currentIndex == index ? 14.0 : 10.0,
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                    color: _currentIndex == index
                        ? Colors.blueAccent
                        : Colors.grey.withOpacity(0.4),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}
