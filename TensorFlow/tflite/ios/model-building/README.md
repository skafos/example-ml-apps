# Training an Image Classification Model
<img src="https://4.bp.blogspot.com/-fmvGmp_whI8/WgtKIGtvHvI/AAAAAAAAEFM/IqS891VhVvUd_j73guSDUDS0YUYDAYgWACLcBGAs/s1600/image1.png" width="400" height="70"> <img src="https://skafos.ai/wp-content/uploads/2019/05/skafos_horizontal_on_white_beta@1x.svg" width="400" height="70">

Image classification is the task of assigning a label to an image (classifying the image as one thing or another).

Training (or building) a model is the process of using existing data, running it through an algorithm, and generating a model artifact, which can then be used to make a prediction on a new piece of data. In this case, the data are images, the algorithm is a neural network, and the model artifact is a `.tflite` object.

## Current Examples

Currently, we have one example notebook, [more_pets_tflite.ipynb](https://colab.research.google.com/github/skafos/example-ml-apps/blob/master/TensorFlow/tflite/ios/model-building/more_pets_tflite.ipynb), but may add others if the need arises.

* [More Pets](https://colab.research.google.com/github/skafos/example-ml-apps/blob/master/TensorFlow/tflite/ios/model-building/more_pets_tflite.ipynb): In this example, we train a model to classify an image as a rabbit, mouse, hamster, fish, lizard, or snake. It is similar to [another example](https://colab.research.google.com/github/skafos/colab-example-models/blob/master/ImageClassification/more_pets.ipynb) we've trained, with modifications as appropriate.

## Tips and "Gotchas"

-  **Training Data**: In order for an image classifier to identify a particular category, it must have trained on images labeled as such. For example, if a model was trained on dogs and cats, and it is shown a plant, it will identify that plant as either a dog or cat. To build an image classification model that identifies plants or other types of objects, you would need to retrain the model, using labeled images of the type you want.
-  **Model Runtime**: Any image classification model leveraging a neural network takes a long time to train on CPU. Definitely take advantage of Google
colab's free GPU runtimes. The link provided in the main README should have that automatically selected.
-  **Model Size**: TF-Lite is optimized for use on mobile devices, and in converting from TensorFlow to TensorFlow Lite, your model should be well-sized to run on-device. Models that are too large can cause problems on-device.

## Need Help?
Didn't find something you need? Confused by something? Need more guidance?

- [**Check out our platform documentation**](https://docs.skafos.ai)

Please contact us with questions or feedback! Here are two ways:

-  [**Signup for our Slack Channel**](https://join.slack.com/t/metismachine-skafos/shared_invite/enQtNTAxMzEwOTk2NzA5LThjMmMyY2JkNTkwNDQ1YjgyYjFiY2MyMjRkMzYyM2E4MjUxNTJmYmQyODVhZWM2MjQwMjE5ZGM1Y2YwN2M5ODI)
-  [**Find us on Reddit**](https://reddit.com/r/skafos)
