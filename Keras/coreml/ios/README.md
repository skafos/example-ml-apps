# Keras & Skafos on iOS
<img src="https://s3.amazonaws.com/keras.io/img/keras-logo-2018-large-1200.png" width="350" height="110"> <img src="https://skafos.ai/wp-content/uploads/2019/05/skafos_horizontal_on_white_beta@1x.svg" width="350" height="100">

In this example, you will see how to train a word-level phrase generation model in Keras, convert to CoreML format, upload to Skafos using the Python SDK, and deploy to an
example iOS application.

## Setups
In order to get the most value from this example, we recommend following these steps:

- Go to the
[Skafos Dashboard](https://dashboard.skafos.ai) and login or create a free account.
- Click the link to create a new app integration called `PhraseGenerator` (or something similar).
- Create a new model called `PhraseGenModel`.

Once you have completed these steps, you will then be able to:

* Build the example iOS App, provided in the `app/` folder of this repo. The app ships with a default word-level phrase generation model.
* Build a second word-level phrase generation model, using the example provided in the `model-building` folder.

You can do these things in either order, but we recommend building a second model before building the app itself. This way, you can immediately swap out the default model for the one you've built, and see the power of Skafos.

### Model Building
In the `model-building/` folder, we provide a Jupyter Notebook, runnable on Google Colab (with GPU support!). This notebook walks you through building a Keras model that generates new words in a sequence based on some input text. By no means is the model perfect, so we recommend taking some time to tune the model to meet your needs.

### App
Inside the `app/` folder you'll find a pre-packed Xcode project to work with.

## Questions & Issues?
See our [Documentation](https://docs.skafos.ai), [FAQs](https://docs.skafos.ai/sections/faq.html), other examples in this repo, and [Join our Slack Community](https://skafosai.slack.com/join/shared_invite/enQtNTAxMzEwOTk2NzA5LThjMmMyY2JkNTkwNDQ1YjgyYjFiY2MyMjRkMzYyM2E4MjUxNTJmYmQyODVhZWM2MjQwMjE5ZGM1Y2YwN2M5ODI)!

If you still can't find what you need, please open an issue on this repo and we will address it.
