# Expense Logger

A cross-platform Flutter app to log, view, and manage your personal expenses with Firebase authentication and Firestore database.

---

## ✨ Features
- Email/password registration and login (Firebase Auth)
- Add, edit, and delete expenses
- Filter expenses by category
- View total expenses
- Real-time sync with Firestore
- Modern, responsive UI

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.8.0 or newer recommended)
- Firebase project (with Authentication and Firestore enabled)

### Setup
1. **Clone this repository**
2. **Install dependencies**
   ```bash
   flutter pub get
   ```
3. **Firebase Setup**
    - Go to [Firebase Console](https://console.firebase.google.com/)
    - Create a project (if you don't have one)
    - Register your iOS and/or Android app (use your app's bundle ID)
    - Download `GoogleService-Info.plist` (iOS) and place it in `ios/Runner/`
    - Download `google-services.json` (Android) and place it in `android/app/`
    - Enable **Email/Password** authentication in Firebase Console > Authentication > Sign-in method
    - Enable **Cloud Firestore** in Firebase Console > Firestore Database
4. **iOS Only**
    - In `ios/Podfile`, set `platform :ios, '13.0'`
    - Run:
      ```bash
      cd ios
      pod install
      cd ..
      ```
5. **Run the app**
   ```bash
   flutter run
   ```

---

## 🔒 Security Notice

**IMPORTANT**: Firebase configuration files contain sensitive API keys and should never be committed to version control.

- Template files are provided: `GoogleService-Info.plist.template` and `google-services.json.template`
- Replace the template files with your actual Firebase configuration files
- These files are already excluded from version control via `.gitignore`

---

## 📁 Project Structure
```
lib/
  main.dart                # App entry, Firebase init, routing
  models/
    expense_model.dart     # Expense data model
  screens/
    login_screen.dart      # Login UI
    register_screen.dart   # Registration UI
    home_screen.dart       # Expense list, filter, total
    add_expense_screen.dart# Add/edit expense UI
  services/
    auth_service.dart      # Auth logic
    expense_service.dart   # Firestore CRUD logic
```

---

## 🛠️ Dependencies
- firebase_core
- firebase_auth
- cloud_firestore
- cupertino_icons

---

## 📝 Usage
- **Register:** Tap "Sign Up" and create an account
- **Login:** Enter your credentials and tap "Sign In"
- **Add Expense:** Tap the + button, fill the form, and save
- **Edit/Delete:** Tap an expense to edit, or use the delete icon
- **Filter:** Use the dropdown to filter by category
- **Logout:** Tap the logout icon in the app bar

---

## 🔒 Security
- All user data is stored securely in Firestore, scoped to each user's UID
- Authentication is handled by Firebase Auth
- Firebase configuration files are excluded from version control

---

## 📱 Screenshots
<img width="1423" alt="Screenshot 2025-06-26 at 11 38 16 PM" src="https://github.com/user-attachments/assets/0a2ce64f-8e34-4752-939a-0aaf748494f7" />

<br>
<br>
<img width="385" alt="Screenshot 2025-06-26 at 11 58 40 PM" src="https://github.com/user-attachments/assets/0030a0c3-47f5-4cb0-b143-cd70411dfe92" />

---

## 🤝 Contributing
Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.

---

## 📄 License
This project is licensed under the MIT License.
