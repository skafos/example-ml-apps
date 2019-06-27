# CoreML Phrase Generator iOS App
<img src="https://s3.amazonaws.com/keras.io/img/keras-logo-2018-large-1200.png" width="350" height="110"> <img src="https://skafos.ai/wp-content/uploads/2019/05/skafos_horizontal_on_white_beta@1x.svg" width="350" height="100">

## Overview
This is an example application for [CoreML]() on iOS. It uses a
Keras-built neural network to predict likely next words in a phrase given some seed text.

**[Skafos](https://skafos.ai) has been integrated to deliver model updates over-the-air.**

### Model
The `PhraseGenModel.mlmodel` included in the app bundle was trained on text
from **Presidential Inaugural Addresses** over the last ~40 years. In the `model-building/` section, you should have trained your own model in the style of **William Shakespeare**.

### Requirements

*   Device with iOS 12.0 or above
*   Xcode 10.0 or above
*   Valid Apple Developer ID
*   Xcode command-line tools (run `xcode-select --install`)
*   [CocoaPods](https://cocoapods.org/) (run `bash sudo gem install cocoapods`)

If this is a new install, you will need to run the Xcode application once to
agree to the license before continuing.

## Build and Run

1.  Clone this GitHub repository to your workstation. `bash git clone
    https://github.com/skafos/example-ml-apps.git`

2.  Install the pod to generate the workspace file: `cd
    example-ml-apps/Keras/coreml/ios/app/ && pod install`

Note: If you have installed this pod before and that command doesn't work, try
`pod update`.

At the end of this step you should have a directory called
`PhraseGenerator.xcworkspace`.

1.  Open the project in Xcode with the following command: `open
    PhraseGenerator.xcworkspace`

This launches Xcode and opens the `PhraseGenerator` project.

1.  Select the `PhraseGenerator` project in the left hand navigation to open
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

**The app should build and install on your test device with the INITIAL model.**

*After you've deployed your newly trained [PhraseGenModel](https://github.com/skafos/example-ml-apps/blob/master/Keras/coreml/ios/model-building/phrase_generator_model.ipynb) from the dashboard, re-run your application, and you should see the phrase completions change to reflect the deployed model! It may take a few seconds depending on network speed. Congratulations - you've just deployed your first Skafos model version to an app!*
