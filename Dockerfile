# Start from a Python 3.8 image
FROM python:3.8

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    uuid-runtime \
    gawk

# Set working directory
WORKDIR /app

# Copy the bash and python scripts
COPY run_model.sh /app
COPY prediction_script.py /app

# Copy your trained models and data
COPY neural_net /app/neural_net/
COPY data/stack_model.joblib /app/data/
COPY data/intermediate_data.csv /app/data/

# Install Python dependencies
COPY requirements.txt /app
RUN pip install -r requirements.txt

# Make bash script executable
RUN chmod +x /app/run_model.sh

# Define the command that will be run when starting the container
ENTRYPOINT ["/app/run_model.sh"]
