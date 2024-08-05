# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set environment variables
ENV APP_HOME=/app

# Create and set the working directory
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

# Copy the shared folder contents into the container at /app
COPY shared/ $APP_HOME/

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r $APP_HOME/requirement.txt

# Copy the entrypoint script into the container
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /usr/local/bin/entrypoint.sh

# Use the entrypoint script to run all Python scripts
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
