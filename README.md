## 🛠️ Installation & Setup

Follow these steps sequentially to set up the project locally:

### 1. Clone the Repository

First, clone this repository to your local machine using Git:

```bash
git clone https://github.com/Vergeo/beebites-frontend
cd beebites-frontend
```

### 2. Install Dependencies

Fetch all the required packages and dependencies listed in the `pubspec.yaml` file:

```bash
flutter pub get
```

### 3. Launch the Emulator or Connect a Device

You can either connect a physical Android device or launch an Android simulator.

To list available emulators, run:

```bash
flutter emulators
```

To launch a specific emulator by its ID/name, run:

```bash
flutter emulators --launch <EMULATOR_NAME>
```

_(Alternatively, simply connect your physical Android device via USB)._

### 4. Run the Application

Once your device or emulator is active, boot up the application using:

```bash
flutter run
```

---

## 💡 Troubleshooting & Tips

> ⚠️ **Important Note on First Run:**
> Sometimes, the application might encounter minor bugs or UI glitches during the very first compilation. If this happens, perform a **Hot Restart** to reset the application state:
>
> - **Shortcut:** `Shift` + `R` in the terminal
