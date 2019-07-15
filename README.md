# Skafos Example ML Apps

*At Skafos, we are committed to building a platform that integrates with popular ML training frameworks & on-device ML formats, to create the best possible user experience delivering models to the edge.*

With the wide array of tools and technologies available, **it is challenging to develop an end-to-end machine learning architecture for mobile deployment**.

## Overview
In this repository, we're assembling example workflows that demonstrate all parts of the end-to-end pipeline: *model training*, *delivery*, and *mobile app integration*.

Each example features:
- An ML task oriented use-case
- An [ML Training Framework](#ml training frameworks) & [On-Device ML Format](#on-device ml formats) (*see description below*)
- [Skafos](https://dashboard.skafos.ai) for model updates, management, and monitoring

Each example includes:
- Model training code (*Jupyter Nobetook*) that can be run on **Google Colab**
- A mobile app that that demonstrates model integration and delivery

### ML Training Frameworks
These are libraries you would use to train machine learning models: anything from neural networks to decision tree classifiers. This is absolutely **NOT** an exhaustive list. More will be documented here over time.

- [**TensorFlow**](https://www.tensorflow.org/)
- [**Keras**](https://keras.io/)
- [**TuriCreate**](https://github.com/apple/turicreate)
- [**PyTorch**](https://pytorch.org/)

### On-Device ML Formats
Once you've trained a machine learning model, **you have to convert it to a format optimized for use on mobile**. The two most common formats are:

- [**CoreML**](https://developer.apple.com/documentation/coreml) (iOS only)
- [**TFLite**](https://www.tensorflow.org/lite)

## Available Examples
Below is a growing list of examples in this repository for you to play with: 

- [TensorFlow -> TFLite: Image Classification](https://github.com/skafos/example-ml-apps/tree/master/TensorFlow/tflite/ios)
- [Keras -> CoreML: Phrase Generation](https://github.com/skafos/example-ml-apps/tree/master/Keras/coreml/ios)

*More examples coming soon!*

_____

## Questions? Need Help?

Please don't hesitate to reach out!

- [**Check out our platform documentation**](https://docs.skafos.ai), complete with FAQs
-  [**Signup for our Slack Channel**](https://join.slack.com/t/metismachine-skafos/shared_invite/enQtNTAxMzEwOTk2NzA5LThjMmMyY2JkNTkwNDQ1YjgyYjFiY2MyMjRkMzYyM2E4MjUxNTJmYmQyODVhZWM2MjQwMjE5ZGM1Y2YwN2M5ODI)
-  [**Find us on Reddit**](https://reddit.com/r/skafos)
-  Submit an issue to this github repo and we will address it
