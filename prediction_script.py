import argparse
import pandas as pd

from joblib import dump, load
from keras.models import load_model

parser = argparse.ArgumentParser(description='Make predictions using trained model')
parser.add_argument('input_file', type=str, help='Input CSV file')

args = parser.parse_args()
input_data = pd.read_csv(args.input_file)

loaded_nn_model = load_model('neural_net')
loaded_se_model = load('data/stack_model.joblib')

y_pred = 0.5 * (  
    loaded_se_model.predict(input_data.drop(columns="team")) + 
    loaded_nn_model.predict(input_data.drop(columns="team"), verbose=False).transpose()[0]
)

print(list(y_pred))
