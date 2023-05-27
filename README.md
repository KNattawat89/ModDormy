# ModDormy App

Welcome to ModDormy, an application designed to simplify the process of finding and managing dormitories.

## Getting Started

To get started with the ModDormy app, follow these steps:

1. Run `flutter pub get` to resolve dependencies and ensure all required packages are installed.
2. Execute the `main.dart` file to launch the application.

## Features

ModDormy offers the following features:

1. **Authentication**
   - Login: Users can log in to their accounts.
   - Register: New users can create an account.
   - Forgot Password: Users can recover their forgotten passwords.

2. **Profile**
   - Edit Profile: Users can modify their personal information, including name, telephone number, and email.
   - Change User Profile: Users can update their profile picture.

3. **Review**
   - Adding Review: Users can write reviews for dormitories.
   - Deleting Review: Users can remove their previously submitted reviews.

4. **Manage Dorm and Room**
   - Adding Dorm and Room: Dormitory owners can add new dormitories and rooms to the app.
   - Editing Dorm and Room: Dormitory owners can modify existing dormitory and room details.
   - Deleting Dorm and Room: Dormitory owners can remove dormitories and rooms from the app.

5. **Favorite**
   - Adding Favorite: Users can add dormitories to their list of favorites.
   - Removing Favorite: Users can remove dormitories from their list of favorites.

6. **Tag**
   - Filter Tag: Users can filter dormitories based on specific tags to find ones that match their preferences.

## User Roles

ModDormy supports two types of users:

1. **Customer**: Regular app users who are not dormitory owners. They can access the following features:
   - Write reviews.
   - View dormitories (even without logging in).
   - Use the "Profile," "Favorite," and "Manage Dorm and Room" features.

2. **Dormitory Owner**: Users who own dormitories and have additional privileges. They cannot write reviews but can perform the following actions:
   - Add, edit, and delete dormitories and rooms.
   - Use the "Profile," "Favorite," and "Manage Dorm and Room" features.

Please note the following:

1. Dormitory owners cannot write reviews, while customers can write reviews freely.
2. Even without logging in, users can browse dormitories but cannot access certain features available only to logged-in users.
3. Logged-in users can access the "Profile," "Favorite," and "Manage Dorm and Room" features.

We hope you find the ModDormy app convenient and enjoyable to use!
