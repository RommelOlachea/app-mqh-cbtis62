import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mqh_rommel/controllers/auth_controller.dart';
import 'package:mqh_rommel/controllers/levels_controller.dart';
import 'package:mqh_rommel/presentation/widgets/user_avatar_image.dart';
import 'package:mqh_rommel/utils/utils_app.dart';

class ProgressScreen extends ConsumerStatefulWidget {
  const ProgressScreen({super.key});

  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends ConsumerState<ProgressScreen> {
  int level = 0;

  @override
  void initState() {
    super.initState();
    _fetchCompletedLevels();
  }

  Future<void> _fetchCompletedLevels() async {
    var completedLevels;
    final user = ref.read(authControllerProvider);
    if (user != null) {
      completedLevels = await ref
          .read(levelsControllerProvider.notifier)
          .countCompletedLevels(user.id, 10);

      completedLevels = completedLevels ?? 0;

      //completedLevels = 5;
      setState(() {
        level = completedLevels;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String imageProfile =
        UtilsApp.cleanEmailUsername(ref.watch(authControllerProvider)!.email);

    String username = ref.watch(authControllerProvider)!.name;
    // Escucha reactivamente los cambios:
    final levelsModel = ref.watch(levelsControllerProvider);
    final completedLevels = levelsModel?.completedLevels ?? 0;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[900]!, Colors.blueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  color: Colors.white,
                ),
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Center(
                      child: Column(children: [
                        const SizedBox(height: 70),
                        UserAvatarImage(
                          imageProfile: imageProfile,
                          radius: 90,
                          color: Colors.purple,
                          width: 5,
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    username,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  // Text(
                  //   "Nivel: $level",
                  //   style: const TextStyle(
                  //     fontSize: 20,
                  //     color: Colors.black,
                  //   ),
                  // ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Niveles Completados",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Stack(
                    children: [
                      Container(
                        height: 12,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 12,
                        width:

                            // MediaQuery.of(context).size.width * (completedLevels ?? 0) ,
                            (MediaQuery.of(context).size.width) *
                                ((completedLevels ?? 0) / 10),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFFBA68C8), Color(0xFF8E24AA)],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width *
                            (completedLevels ?? 0),
                        top: -3,
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: Color(0xFF8E24AA), width: 3),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nivel: $completedLevels",
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      const Text(
                        "Siguiente nivel",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/preferences');
        },
        backgroundColor: Colors.purple,
        child: const Icon(
          Icons.settings,
          color: Colors.white,
        ),
      ),
    );
  }
}
