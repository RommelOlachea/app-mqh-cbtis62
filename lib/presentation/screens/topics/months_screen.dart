import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mqh_rommel/constants/app_constants.dart';
import 'package:mqh_rommel/controllers/auth_controller.dart';
import 'package:mqh_rommel/presentation/widgets/user_avatar_image.dart';
import 'package:mqh_rommel/utils/utils_app.dart';

class MonthsScreen extends ConsumerStatefulWidget {
  @override
  _MonthsScreenState createState() => _MonthsScreenState();
}

class _MonthsScreenState extends ConsumerState<MonthsScreen> {
  final Map<String, String> mediaList = AppConstants().months;

  int currentIndex = 0;

  void _nextMedia() {
    if (currentIndex < mediaList.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  void _prevMedia() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  String _getLetterFromMedia(String media) {
    return media.split('/').last.split('.').first.toUpperCase()[0];
  }

  @override
  Widget build(BuildContext context) {
    String imageProfile =
        UtilsApp.cleanEmailUsername(ref.watch(authControllerProvider)!.email);

    final currentMedia = mediaList.keys.elementAt(currentIndex);
    final currentLetter = _getLetterFromMedia(currentMedia);

    final  description =  mediaList[currentMedia];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Meses LSM',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: UserAvatarImage(imageProfile: imageProfile, radius: 30, color: Colors.white, width: 1,),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! < 0) {
            _nextMedia();
          } else if (details.primaryVelocity! > 0) {
            _prevMedia();
          }
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue[900]!, Colors.blueAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding:const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 130),
              CircleAvatar(
                radius: 44,
                backgroundColor: Colors.blue,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Text(
                    currentLetter,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  currentMedia,
                  key: ValueKey(currentMedia),
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Color(0xFF66BB6A), Color(0xFF43A047)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 25,
                      ),
                      onPressed: _prevMedia,
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Color(0xFFFFA726), Color(0xFFFF7043)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 25,
                      ),
                      onPressed: _nextMedia,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      description ?? 'Sin descripción',
                      style: TextStyle(fontSize: 19, color: Colors.white),
                    ),
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
