# Record & listen

This  application allows users to record audio using their device's microphone and play it back.

## Features

*   Record audio with a single button press.
*   Play back recorded audio.
*   Pause playback.
*   Uses `flutter_sound` for audio recording and playback.
*   Uses `permission_handler` for microphone permission requests.

## Getting Started

1.  **Prerequisites:**
    *   Flutter SDK installed.
    *   Android Studio 

2.  **Installation:**
    *   Clone this repository
        ```bash
        git clone https://github.com/Hanan-Mosa/record-listen.git
        ```
    *   Get Dependencies
        ```bash
        flutter pub get
        ```

    *   Run project
        ```bash
         flutter run
        ```
3.  **Permissions:**
    *   **Android:** Add the following permission to your `AndroidManifest.xml` file (inside the `<manifest>` tag):

        ```xml
        <uses-permission android:name="android.permission.RECORD_AUDIO" />
        <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
        <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
        ```
## Code Explanation

The code uses the `flutter_sound` plugin to record and play audio.
It requests microphone permission using the `permission_handler` plugin. 
The `startRecording()` function starts the recording process.
The `stopRecording()` function stops the recording and saves the file path. 
The "Play Audio" button appears only after a recording is made. 
The `playAudio()` function plays the recorded audio, and `pauseAudio()` pauses it.

## Video Demo
https://github.com/user-attachments/assets/18d12211-8a34-4933-a66e-e3c6ca4feab7


