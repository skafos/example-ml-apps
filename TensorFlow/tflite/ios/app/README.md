# TensorFlow Lite Image Classification iOS App
<img src="https://4.bp.blogspot.com/-fmvGmp_whI8/WgtKIGtvHvI/AAAAAAAAEFM/IqS891VhVvUd_j73guSDUDS0YUYDAYgWACLcBGAs/s1600/image1.png" width="400" height="70"> <img src="https://skafos.ai/wp-content/uploads/2019/05/skafos_horizontal_on_white_beta@1x.svg" width="400" height="70">

## Overview
This is an example application for [TensorFlow Lite](https://tensorflow.org/lite)
on iOS. It uses [Image classification](https://www.tensorflow.org/lite/models/image_classification/overview)
to continuously classify whatever it sees from the device's back camera, using
a quantized MobileNet model. The application must be run on device.

**[Skafos](https://skafos.ai) has been integrated to deliver model updates over-the-air.**

### Model
For details of the model used, visit [Image classification](https://www.tensorflow.org/lite/models/image_classification/overview).

In the `model-building/` section, you should have trained your own model with

### Requirements

*   Device with iOS 12.0 or above
*   Xcode 10.0 or above
*   Valid Apple Developer ID
*   Xcode command-line tools (run `xcode-select --install`)
*   [CocoaPods](https://cocoapods.org/) (run `bash sudo gem install cocoapods`)

If this is a new install, you will need to run the Xcode application once to
agree to the license before continuing.

Note: The demo app requires a camera and must be executed on a real iOS device.
You can build it and run with the iPhone Simulator, but the app will raise a
`Camera not found` exception.

## Build and Run

1.  Clone this GitHub repository to your workstation. `bash git clone
    https://github.com/skafos/example-ml-apps.git`

2.  Install the pod to generate the workspace file: `cd
    example-ml-apps/TensorFlow/tflite/ios/app/ && pod install`

Note: If you have installed this pod before and that command doesn't work, try
`pod update`.

At the end of this step you should have a directory called
`ImageClassification.xcworkspace`.

1.  Open the project in Xcode with the following command: `open
    ImageClassification.xcworkspace`

This launches Xcode and opens the `ImageClassification` project.

1.  Select the `ImageClassification` project in the left hand navigation to open
    the project configuration. In the **Signing** section of the **General**
    tab, select your development team from the dropdown.

2.  In order to build the project, you must modify the **Bundle Identifier** in
    the **Identity** section so that it is unique across all Xcode projects. To
    create a unique identifier, try adding your initials and a number to the end
    of the string.

3. Add your Skafos environment keys to the `AppDelegate.swift` file.

4. With an iOS device connected, clean (`cmd + k` and `cmd + shift + k`),
build and run (`cmd + R`) the app in Xcode.

You'll have to grant permissions for the app to use the device's camera. Point
the camera at various objects and enjoy seeing how the model classifies things!

**The app should build and install on your test device with the INITIAL tflite model.**

*After you've deployed your newly trained ["More Pets" tflite model](https://github.com/skafos/example-ml-apps/blob/master/TensorFlow/tflite/ios/model-building/more_pets_tflite.ipynb) from the dashboard, re-run your application, and you should see the model predictions change to reflect the newly delivered model! It may take a few seconds depending on network speed. Congratulations - you've just deployed your first Skafos model version to an app!*

### Warning
_Do not delete the empty references_ to the .tflite and .txt files after you
clone the repo and open the project. These references will be fulfilled once the
model and label files are downloaded when the application is built and run for
the first time. If you delete the references to them, you can still find that
the .tflite and .txt files are downloaded to the Model folder, the next time you
build the application. You will have to add the references to these files in the
bundle separately in that case.
