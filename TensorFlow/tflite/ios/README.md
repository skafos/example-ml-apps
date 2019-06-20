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
In the `model-building/` folder, we provide a Jupyter Notebook, runnable on Google Colab, to build a TensorFlow Lite model that predicts different types of pets, and then deliver it to your app using the Skafos SDK.

### App
Inside the `app/` folder you'll find a pre-packed Xcode project to work with. This iOS app was adapted from this [TensorFlow example](https://github.com/tensorflow/examples/tree/master/lite/examples/image_classification/ios).

## Questions & Issues?
See our [Documentation](https://docs.skafos.ai), [FAQs](https://docs.skafos.ai/sections/faq.html), other examples in this repo, and [Join our Slack Community](https://skafosai.slack.com/join/shared_invite/enQtNTAxMzEwOTk2NzA5LThjMmMyY2JkNTkwNDQ1YjgyYjFiY2MyMjRkMzYyM2E4MjUxNTJmYmQyODVhZWM2MjQwMjE5ZGM1Y2YwN2M5ODI)!

If you still can't find what you need, please open an issue on this repo and we will address it.
