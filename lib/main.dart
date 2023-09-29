import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'App',
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          // Portrait Mode
          return Scaffold(
            appBar: buildAppBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    buildProfilePicture(),
                    const SizedBox(height: 10),
                    Center(child: buildName(context)),
                    const SizedBox(height: 15),
                    buildDescription(context),
                    const SizedBox(height: 10),
                    buildImageGrid(),
                  ],
                ),
              ),
            ),
          );
        } else {
          // Landscape Mode
          return Scaffold(
            appBar: buildAppBar(),
            body: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: buildProfilePicture(),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        buildName(context),
                        const SizedBox(height: 15),
                        buildDescription(context),
                        const SizedBox(height: 10),
                        buildImageGrid(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          );
        }
      },
    );
  }
}

//class started


const String myName = "Farhad Mia";
const String myDescription =
    "Hello, I am Md. Farhad Mia. I love Travelling and I want to explore the whole world that's my dream.";

AppBar buildAppBar() {
  return AppBar(
    title: const Text("Profile"),
    toolbarHeight: 50,
  );
}

GridView buildImageGrid() {
  return GridView.builder(
    shrinkWrap: true,
    itemCount: 9,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
    ),
    itemBuilder: (context, index) => Image.asset(
      "images/imageB.jpg",
      fit: BoxFit.cover,
    ),
  );
}

AspectRatio buildProfilePicture() {
  return AspectRatio(
    aspectRatio: 1,
    child: Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("images/imageA.jpg"),
        ),
      ),
    ),
  );
}

Text buildName(BuildContext context) {
  return Text(
    myName,
    style: Theme.of(context).textTheme.titleLarge,
  );
}

Text buildDescription(BuildContext context) {
  return Text(
    myDescription,
    style: Theme.of(context).textTheme.bodyLarge,
  );
}