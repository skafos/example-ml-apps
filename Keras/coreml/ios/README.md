# Keras & Skafos on iOS
<img src="https://s3.amazonaws.com/keras.io/img/keras-logo-2018-large-1200.png" width="350" height="110"> <img src="https://skafos.ai/wp-content/uploads/2019/05/skafos_horizontal_on_white_beta@1x.svg" width="350" height="100">

In this example,

model in Keras, upload to Skafos using the Python SDK, and deploy to an
example iOS application.

## Setups
In order to get the most value from this example, we recommend following these steps:

- head over the the
[Dashboard](https://dashboard.skafos.ai) and login or create a free account.
- create a new app integration called `WordModel-iOS-App` (or something similar).
- create a new model called `WordModel`.

Before playing with the iOS app, go through the model building section next!

### Model Building
In the `model-building/` folder, we provide a Jupyter Notebook, runnable on Google Colab, to build a Keras model that generates new words in a sequence based on some input text.

### App
Inside the `app/` folder you'll find a pre-packed Xcode project to work with.

## Questions & Issues?
See our [Documentation](https://docs.skafos.ai), [FAQs](https://docs.skafos.ai/sections/faq.html), other examples in this repo, and [Join our Slack Community](https://skafosai.slack.com/join/shared_invite/enQtNTAxMzEwOTk2NzA5LThjMmMyY2JkNTkwNDQ1YjgyYjFiY2MyMjRkMzYyM2E4MjUxNTJmYmQyODVhZWM2MjQwMjE5ZGM1Y2YwN2M5ODI)!

If you still can't find what you need, please open an issue on this repo and we will address it.
