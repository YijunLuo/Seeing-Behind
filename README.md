# Seeing-Behind
This project targets at helping Brad to see things behind him without turning around his wheelchair. The basic ideal we came up with is to mount two cameras on the back of Brad's wheelchair, whose video streamings will be received by his iPhone. We also developed an iOS app to display the video streaming, enabling a few features for his convenience.
## Hardware
The hardware part consists of a Raspberry Pi and two webcams. The Raspberry Pi should be charged and the webcams should be connect to the Raspberry Pi.
## Software Packages
[MjpegStreamingKit](https://github.com/freedom27/MjpegStreamingKit)
[NMSSH](https://github.com/NMSSH/NMSSH)
## Alpha Release
### How to build and run the project
  - Turn on _Raspberry Pi_. It will automatically send you an email containing the ip address of Pi.
  - Open ```Seeing-Behind-Alpha.xcodeproj```.
  - Connect your iPhone to your Mac. In the Scheme toolbar, choose your iPhone as the device to run the project and press _Build_ button.
  - Select ```Seeing-Behind-Alpha.xcodeproj``` in _Navigator_ and in _general > signing_ select your personal team and verify your provisioning profile.
  - Same operation on ```MjpegStreamingKit.xcodeproj```.
  - Restart your Xcode.
  - Change variable ```host_url``` in ```AppDelegate.swift``` to current ip address of Pi.
  - A demo app will be installed on your iPhone and open automatically.

__NOTE__
  - In alpha release, due to the architectures of imported framworks, current code version could only be built and run on iOS platform, namely, your iPhones.
  - For first-time build, you might need to go to _Settings > General > Device Management_ to trust the certificate.
  - By default, the Raspberry Pi will connect to _MWireless_.

### App Features
  - When opening the app, cameras are automatically turned on. When the app is closed or goes to the background, cameras are turned off without any additional operations, and are turned back on whenever resumed.
  - When the app is closed or sleeps in the background, commands to clear backup files automatically saved on Raspberry Pi are sent to Pi in order to keep it working properly.
  - In the user interface, there are enabled buttons to play and stop the video streaming display, go to a different camera view, and to go back to the main menu.
  - Users can also swipe left and right to see different views and return to the main menu.

## Beta Release
### How to build and run the project
 - Download the code package
 - Download [opencv framework](https://opencv.org/releases.html) and put it in the project folder
 - Add the framework
 - Connect iPhone and build the project
 
 ### App Features
  - There are three pages corresponding to stitched view, camera view 1 and camera view2.
  - Users swipe left and right to switch between different views
  - Users tap on the camera views to stop and play them
