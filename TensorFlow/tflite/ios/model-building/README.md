# Image Classifier Training with TensorFlow
<img src="https://4.bp.blogspot.com/-fmvGmp_whI8/WgtKIGtvHvI/AAAAAAAAEFM/IqS891VhVvUd_j73guSDUDS0YUYDAYgWACLcBGAs/s1600/image1.png" width="400" height="70"> <img src="https://skafos.ai/wp-content/uploads/2019/05/skafos_horizontal_on_white_beta@1x.svg" width="400" height="70">

Get right to it!

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/skafos/example-ml-apps/blob/master/TensorFlow/tflite/ios/model-building/more_pets_tflite.ipynb)

## Tips and "Gotchas"
-  **Image classification** is the task of assigning a label to an image (classifying the image as one thing or another).

-  **Training** (or building) a model is the process of using existing data, running it through an algorithm, and generating a model artifact, which can then be used to make a prediction on a new piece of data. In this case, the data are images, the algorithm is a neural network, and the model artifact is a `.tflite` object.

-  **Extensibility**: In order for an image classifier to identify a particular category, it must have trained on images labeled as such. For example, if a model was trained on dogs and cats, and it is shown a plant, it will identify that plant as either a dog or cat. To build an image classification model that identifies plants or other types of objects, *you would need to retrain the model, using labeled images of the type you want.*

-  **Model Runtime**: Any image classification model leveraging a neural network takes a long time to train on CPU. Definitely take advantage of Google Colab's free GPU runtimes.

-  **Model Size**: TF-Lite is optimized for use on mobile devices, and in converting from TensorFlow to TensorFlow Lite, your model should be well-sized to run on-device. Models that are too large can cause problems on-device.
