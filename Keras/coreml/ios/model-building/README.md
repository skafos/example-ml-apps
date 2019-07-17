# Phrase Generation Training with Keras
<img src="https://s3.amazonaws.com/keras.io/img/keras-logo-2018-large-1200.png" width="350" height="110"> <img src="https://skafos.ai/wp-content/uploads/2019/05/skafos_horizontal_on_white_beta@1x.svg" width="350" height="100">

Phrase generation is the task of predicting the most likely next word, or sequences of words, given some seed text. Get right to it!

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/skafos/example-ml-apps/blob/master/TensorFlow/tflite/ios/model-building/more_pets_tflite.ipynb)

## Tips and "Gotchas"
-  **Training Data**: This model trains on William Shakespeare text. If you want your phrase generator to mimic a different style, you need to swap out the training data for some other writer.
-  **Model Runtime**: Definitely take advantage of Google Colab's free GPU runtimes. The link provided above should have that automatically selected.
-  **Model Quality**: Spend some time tuning the network layers, batch size, training data input sequence length, learning rate or other hyperparameters as desired.
