FROM tensorflow/tensorflow:1.1.0

ADD app /usr/src/app
ADD docker/requirements.txt /usr/src/install/requirements.txt

RUN pip install awscli

WORKDIR /usr/src/app 
CMD python /usr/src/app/mnist.py && \
export AWS_ACCESS_KEY_ID=AKIAIAIVFDMEWXSBBORA && \
export AWS_SECRET_ACCESS_KEY=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 && \
aws s3 cp --recursive /usr/src/logs/mnist_with_summaries s3://usgbc-hiscore-dev/tf-test
