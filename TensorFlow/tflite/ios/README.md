# TensorFlow Lite & Skafos on iOS
In this example, you will see how to train an image classification `.tflite`
model in TensorFlow, upload to Skafos using the Python SDK, and deploy to an
example iOS application.

## Setup
In order to get the most value from this example, we recommend following these steps:

- head over the the
[Dashboard](https://dashboard.skafos.ai) and login or create a free account.
- create a new app integration called `TF-Lite-iOS-App` (or something similar).
- create a new model called `ImageClassifier`.

Before playing with the iOS app, go through the model building section next!

### Model Building

### App
Inside the `app/` folder you'll find a pre-packed Xcode project to work with. This iOS app was adapted from this [TensorFlow example](https://github.com/tensorflow/examples/tree/master/lite/examples/image_classification/ios).

##### Dependencies
First, you need to install all project dependencies using [CocoaPods](https://guides.cocoapods.org/using/getting-started.html):
```bash
cd app/
pod install
```

Open up the project workspace in Xcode:
```bash
open ImageClassification.xcworkspace
```

##### Test out the example
Inside your `AppDelegate.swift`, add your Dev and Prod environment keys. You can
find them under **App** --> **Settings** on the dashboard.

Also be sure to update your team info, bundle ID, etc.

- Clean: `cmd + k` and `cmd + shift + k`
- Build and Run: `cmd + R`

**The app should build and install on your test device with the INITIAL tflite model.**

*After you've deployed your newly trained "More Pets" tflite model form the dashboard, re-run your application, and you should see the model predictions change to reflect the newly delivered model! It may take a few seconds depending on network speed. Congratulations - you've just deployed your first Skafos model version to an app!*


## Questions & Issues?
See our [Documentation](https://docs.skafos.ai), [FAQs](https://docs.skafos.ai/sections/faq.html), other examples in this repo, and [Join our Slack Community](https://skafosai.slack.com/join/shared_invite/enQtNTAxMzEwOTk2NzA5LThjMmMyY2JkNTkwNDQ1YjgyYjFiY2MyMjRkMzYyM2E4MjUxNTJmYmQyODVhZWM2MjQwMjE5ZGM1Y2YwN2M5ODI)!

If you still can't find what you need, please open an issue on this repo and we will address it.
