# TensorFlow Lite & Skafos on iOS
<img src="https://4.bp.blogspot.com/-fmvGmp_whI8/WgtKIGtvHvI/AAAAAAAAEFM/IqS891VhVvUd_j73guSDUDS0YUYDAYgWACLcBGAs/s1600/image1.png" width="400" height="70"> <img src="https://skafos.ai/wp-content/uploads/2019/05/skafos_horizontal_on_white_beta@1x.svg" width="400" height="70">

In this example, you will see how to train an image classification 
model in [TensorFlow](www.tensorflow.org), convert it to `.tflite`, upload to [Skafos](https://skafos.ai) using the [Python SDK](https://sdk.skafos.ai), and deploy to an
example iOS application.

## Setup
In order to get the most value from this example, we recommend following these steps:

- Go to the
[Skafos Dashboard](https://dashboard.skafos.ai) and login or create a free account.
- Click the link to create a new app integration. Name this app `TF-Lite-iOS-App` (or something similar).
- Create a new model called `ImageClassifier`.

Once you have completed these steps, you will then be able to:

* Build the example iOS App, provided in the `app/` folder of this repo. This app ships with a default image classifier model.
* Build a second image classifier model, using the example provided in the `model-building` folder. 

You can do these things in either order, but we recommend building a second model before building the app itself. This way, you can immediately swap out the default model for the one you've built, and see the power of Skafos.  

### Model Building
In the `model-building/` folder, we provide a Jupyter Notebook, runnable on Google Colab. This notebook walks you through building a TensorFlow Lite model that predicts different types of pets, and then shows you how to deliver it to your app using the Skafos SDK.

### App
Inside the `app/` folder you'll find a pre-packed Xcode project to work with. This iOS app was adapted from this [TensorFlow example](https://github.com/tensorflow/examples/tree/master/lite/examples/image_classification/ios).

## Questions & Issues?
See our [Documentation](https://docs.skafos.ai), [FAQs](https://docs.skafos.ai/sections/faq.html), other examples in this repo, and [join our Slack Community](https://skafosai.slack.com/join/shared_invite/enQtNTAxMzEwOTk2NzA5LThjMmMyY2JkNTkwNDQ1YjgyYjFiY2MyMjRkMzYyM2E4MjUxNTJmYmQyODVhZWM2MjQwMjE5ZGM1Y2YwN2M5ODI)!

If you still can't find what you need, please open an issue on this repo and we will address it.
