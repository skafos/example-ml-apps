# TensorFlow Lite & Skafos on iOS
<img src="https://4.bp.blogspot.com/-fmvGmp_whI8/WgtKIGtvHvI/AAAAAAAAEFM/IqS891VhVvUd_j73guSDUDS0YUYDAYgWACLcBGAs/s1600/image1.png" width="400" height="70"> <img src="https://skafos.ai/wp-content/uploads/2019/05/skafos_horizontal_on_white_beta@1x.svg" width="400" height="70">

In this example, you will see how to train an image classification
model in [**TensorFlow**](www.tensorflow.org), convert it to `.tflite`, and deploy to an
iOS application with [**Skafos**](https://dashboard.skafos.ai).

## Setup
Before you do any setup, make sure you have cloned this repository:
```
$ git clone git@github.com:skafos/example-ml-apps.git
$ cd example-ml-apps/TensorFlow/tflite/ios
```

We recommend following these steps to get the most from the example:

1. Go to the
[**Skafos Dashboard**](https://dashboard.skafos.ai) and login or create a free account.
2. Click the link to create a **New App Integration**.

<img src="../../../assets/new_app.png"
     width="150" height="100"
     style="left: left; margin-left: 40px;" />

*Give the app a name like `TF-Lite-iOS-App` (or something similar).*

3. Create a new model called `ImageClassifier`.

Now you're all set to run this example end-to-end! We recommend starting with the model building step.

### 1. Model Building
In the `model-building/` section, we provide some Python code (*Jupyter Notebook*) that can be run on Google Colab to train an image classification model:

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/skafos/example-ml-apps/blob/master/TensorFlow/tflite/ios/model-building/more_pets_tflite.ipynb)

Some important notes:
- The model is trained to classify an image as a rabbit, mouse, hamster, fish, lizard, or snake
- The notebook walks you through building a TensorFlow Lite model & delivering it to your app using the Skafos SDK.
- You will need to grab your **Skafos API Token** from the account settings page on the [dashboard](https://dashboard.skafos.ai)

### 2. App
Inside the `app/` section, we provide a pre-packed Xcode project for you to work with. The iOS app itself was adapted from this [TensorFlow example](https://github.com/tensorflow/examples/tree/master/lite/examples/image_classification/ios), modified to use Skafos for model updates.



-----

## Questions & Issues?
See our [Documentation](https://docs.skafos.ai), [FAQs](https://docs.skafos.ai/sections/faq.html), other examples in this repo, and [join our Slack Community](https://skafosai.slack.com/join/shared_invite/enQtNTAxMzEwOTk2NzA5LThjMmMyY2JkNTkwNDQ1YjgyYjFiY2MyMjRkMzYyM2E4MjUxNTJmYmQyODVhZWM2MjQwMjE5ZGM1Y2YwN2M5ODI)!

If you still can't find what you need, please open an issue on this repo and we will address it.
