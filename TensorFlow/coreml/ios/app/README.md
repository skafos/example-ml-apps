# CoreML Image Classification iOS App
<img src="https://www.gstatic.com/devrel-devsite/va3a0eb1ff00a004a87e2f93101f27917d794beecfd23556fc6d8627bba2ff3cf/tensorflow/images/lockup.svg" width="400" height="70"> <img src="https://skafos.ai/wp-content/uploads/2019/05/skafos_horizontal_on_white_beta@1x.svg" width="400" height="70">

This iOS application uses a [CoreML](https://developer.apple.com/documentation/coreml) model for [Image Classification](https://www.tensorflow.org/lite/models/image_classification/overview) to classify whatever it sees from the device's camera. The model runs on-device, which is optimal for the user experience.


### About the Model
The `ImageClassifier.mlmodel` included in the app bundle was images of Cats and Dogs. However, you should have trained your own model on images of various pets. If you haven't, [follow these steps](../README.md##1-model-building).

## Requirements

*   Device with iOS 12.0 or above
*   Xcode 10.0 or above
*   Valid Apple Developer ID
*   Xcode command-line tools (run `xcode-select --install`)
*   [CocoaPods](https://cocoapods.org/) (run `sudo gem install cocoapods`)

If this is a new install, you will need to run the Xcode application once to
agree to the license before continuing.

## Build and Run

1.  Clone this GitHub repository to your workstation.
```bash
git clone https://github.com/skafos/example-ml-apps.git
```

2.  Install the pod to generate the workspace file:
```bash
cd example-ml-apps/TensorFlow/coreml/ios/app/ && pod install
```

_Note: If you have installed this pod before and that command doesn't work, try
`pod update`._

3. At the end of this step you should have a file called
`CoreMLImageClassification.xcworkspace`. Open the Xcode workspace:
```bash
open CoreMLImageClassification.xcworkspace
```

4.  Select the `CoreMLImageClassification` project in the left hand navigation to open
    the project configuration. In the **Signing** section of the **General**
    tab, select your development team from the dropdown.

5.  In order to build the project, you must modify the **Bundle Identifier** in
    the **Identity** section so that it is unique across all Xcode projects. To
    create a unique identifier, try adding your initials and a number to the end
    of the string.

6. Add your Skafos **Environment Keys** to the `AppDelegate.swift` file.

7. With an iOS device connected, clean (`cmd + k` and `cmd + shift + k`),
build and run (`cmd + R`) the app in Xcode.

**The app should build and install on your test device with the INITIAL model.**

## Update the Model
1. Make sure you actually have a new model to deploy with Skafos!

2. Go to the <a href="https://dashboard.skafos.ai" target="_blank">**Skafos Dashboard**</a>, navigate to the App, and then the `ImageClassifier` that you made to go with this app integration.

3. You should see the model you uploaded in the dashboard. Click the "Deploy" button to deliver it to your Dev environment.

<img src="../../../../assets/model_versions.png" width="70%"
     style="left: left; margin-left: 100px;" />

4. Because we are using Xcode to simulate the builds, you will need to stop and re-run your application to get the new model from Skafos. You will see the model predictions change to reflect the newly delivered model! This may take a few seconds depending on network speed.

*Congratulations - you've just deployed your first Skafos model version to an app!*
