# TensorFlow & Skafos on iOS
<img src="https://4.bp.blogspot.com/-fmvGmp_whI8/WgtKIGtvHvI/AAAAAAAAEFM/IqS891VhVvUd_j73guSDUDS0YUYDAYgWACLcBGAs/s1600/image1.png" width="400" height="70"> <img src="https://skafos.ai/wp-content/uploads/2019/05/skafos_horizontal_on_white_beta@1x.svg" width="400" height="70">

In this example, you will see how to train an **Image Classification**
model with [**TensorFlow**](www.tensorflow.org), convert it to **TFLite** format, and deploy it to an
iOS application with <a href="https://dashboard.skafos.ai" target="_blank">**Skafos**</a>.

## Setup
Before you do any further setup, make sure you've cloned this repository:
```
$ git clone git@github.com:skafos/example-ml-apps.git
$ cd example-ml-apps/TensorFlow/tflite/ios
```

1. Go to the <a href="https://dashboard.skafos.ai" target="_blank">Skafos Dashboard</a> and login or create a free account.
2. Click the link to create a **New App Integration**.

<img src="../../../assets/new_app.png"
     width="20%"
     style="left: left; margin-left: 50px;" />

3. Give the app a name like `TF-Lite-iOS-App` (or something similar).
4. Create a new model called `ImageClassifier`.

Now you're all setup to upload model versions and deploy to an iOS app from the dashboard!

### 1. Model Building
We've provided some Python code (*Jupyter Notebook*) that can be run on Google Colab to train an image classification model:

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/skafos/example-ml-apps/blob/master/TensorFlow/tflite/ios/model-building/more_pets_tflite.ipynb)

Some important notes:
- The model is trained to classify an image as a rabbit, mouse, hamster, fish, lizard, or snake.
- Grab your **Skafos API Token** from the Account Settings page on the [dashboard](https://dashboard.skafos.ai).

### 2. iOS App
We've provided a pre-packed Xcode project for you to work with. All project contents can be found in the `app/` subdirectory. *The app is based on [TensorFlow's example](https://github.com/tensorflow/examples/tree/master/lite/examples/image_classification/ios), but we've integrated the [Skafos iOS Framework](https://github.com/skafos/ios) to handle model updates over-the-air.*

Make sure you have the following requirements satisfied:

- Device with iOS 12.0 or above
- Xcode 10.0 or above
- Valid Apple Developer ID
- Xcode command-line tools (run `xcode-select --install`)
- CocoaPods (run `sudo gem install cocoapods`)

Follow the [Build & Run: Step-By-Step Instructions](app/README.md#build--run-step-by-step-instructions) to build the app!

Some important notes:
- The initial model pre-bundled in the app is trained to classify random objects.
- With Skafos, you can deploy your newly trained image classifier (from above).
- Grab your **Environment Keys** for Dev and Prod from the App Settings page on the <a href="https://dashboard.skafos.ai" target="_blank">dashboard</a>.
-----

## Questions & Issues?
See our [Documentation](https://docs.skafos.ai), [FAQs](https://docs.skafos.ai/sections/faq.html), other examples in this repo, and [join our Slack Community](https://skafosai.slack.com/join/shared_invite/enQtNTAxMzEwOTk2NzA5LThjMmMyY2JkNTkwNDQ1YjgyYjFiY2MyMjRkMzYyM2E4MjUxNTJmYmQyODVhZWM2MjQwMjE5ZGM1Y2YwN2M5ODI)!

If you still can't find what you need, please open an issue on this repo and we will address it.
