import tensorflow as tf
import numpy as np

from tensorflow.contrib import predictor

predict_fn = predictor.from_saved_model("model2")
predictions = predict_fn(
    {"x": [[6.4, 3.2, 4.5, 1.5],
           [5.8, 3.1, 5.0, 1.7]]})
print(predictions['scores'])