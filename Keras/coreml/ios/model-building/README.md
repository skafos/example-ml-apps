# Training a Phrase Generation Model
<img src="https://s3.amazonaws.com/keras.io/img/keras-logo-2018-large-1200.png" width="350" height="110"> <img src="https://skafos.ai/wp-content/uploads/2019/05/skafos_horizontal_on_white_beta@1x.svg" width="350" height="100">

Phrase generation is the task of predicting the most likely next word, or sequences of words, given some seed text.

Training (or building) this type of model requires gathering training data, running it through an algorithm, and generating a model artifact, which can then be used to make predictions. In this case, the data are text samples from the works of William Shakespeare, the algorithm is a neural network, and the model artifact is a `.mlmodel` object.

## Current Examples
Currently, we have one example notebook, [phrase_generator_model.ipynb](https://colab.research.google.com/github/skafos/example-ml-apps/blob/master/Keras/coreml/ios/model-building/phrase_generator_model.ipynb), but may add others if the need arises.

## Tips and "Gotchas"
-  **Training Data**: This model trains on William Shakespeare text. If you want your phrase generator to mimic a different style, you need to swap out the training data for some other writer.
-  **Model Runtime**: Definitely take advantage of Google Colab's free GPU runtimes. The link provided above should have that automatically selected.
-  **Model Quality**: Spend some time tuning the network layers, batch size, training data input sequence length, learning rate or other hyperparameters as desired.

## Need Help?
Didn't find something you need? Confused by something? Need more guidance?

- [**Check out our platform documentation**](https://docs.skafos.ai)

Please contact us with questions or feedback! Here are two ways:

-  [**Signup for our Slack Channel**](https://join.slack.com/t/metismachine-skafos/shared_invite/enQtNTAxMzEwOTk2NzA5LThjMmMyY2JkNTkwNDQ1YjgyYjFiY2MyMjRkMzYyM2E4MjUxNTJmYmQyODVhZWM2MjQwMjE5ZGM1Y2YwN2M5ODI)
-  [**Find us on Reddit**](https://reddit.com/r/skafos)
