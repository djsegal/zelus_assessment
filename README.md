# Zelus Sports Analytics Tech Assessment
This repository contains the code and data for the ML engineer technical assessment from Zelus Sports Analytics.

## Structure
The repository is structured as follows:

- `Dan_Segal_ML_Engineer_Question_N.ipynb`: Jupyter notebook containing the solutions to Questions 1-4.
- `data/`: Downloaded original input and various intermediate data
- `neural_net/` and `data/`: Directory containing the pre-trained machine learning models (Neural Network and Stacked Ensemble).
- `prediction_script.py`: Python script used to predict the expected runs per over using the pre-trained models.
- `run_model.sh`: Bash script used to filter the intermediate data for a specific team and number of overs, and to run `prediction_script.py`.
- `requirements.txt`: File containing the Python dependencies required for `prediction_script.py`.
- `Dockerfile`: Dockerfile used to build the Docker image for Question 4.

Additional files include:
- `Zelus_Written_Interview.pdf`: 8 answered questions from the first round interview spanning from work experience to research interests
- `Dan_Segal_Julia_Packages_June_2023.pdf`: Slides for presentation on improving JuliaPackages.com categorization using the ChatGPT API

## Prerequisites
You need to have Docker installed on your machine to build and run the Docker image for Question 4. You can download Docker from [here](https://www.docker.com/products/docker-desktop).

To run the Jupyter notebook, you need to have Jupyter installed, and the Python dependencies specified in `requirements.txt`.

## Instructions

### Running the Jupyter notebook
To run the Jupyter notebook, navigate to the directory containing `Dan_Segal_ML_Engineer_Question_N.ipynb`, open a terminal, and type:

```
jupyter notebook
```

Then, open `Dan_Segal_ML_Engineer_Question_N.ipynb` in the Jupyter notebook dashboard.

### Building the Docker image
To build the Docker image, navigate to the directory containing `Dockerfile`, open a terminal, and type:

```
docker build -t zelus-tech-assessment .
```

This builds a Docker image and tags it as `zelus-tech-assessment`.

### Running the Docker container
To run the Docker container, open a terminal and type:

```
docker run -it zelus-tech-assessment <team> <overs>
```

Replace `<team>` and `<overs>` with the name of the team and the number of overs, respectively.

This runs the Docker container, which executes `run_model.sh` with the specified team and number of overs.

## Note
If you encounter any issues or have any questions about the code or data, please open an issue or submit a pull request.
