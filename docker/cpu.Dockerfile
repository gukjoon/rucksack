FROM tensorflow/tensorflow:1.0.1

ADD app /usr/src/app
ADD docker/requirements.txt /usr/src/install/requirements.txt

RUN apt-get update && apt-get install cmake -y
RUN apt-get install libboost-python-dev -y
RUN apt-get install graphviz -y
RUN pip install --no-cache-dir -r /usr/src/install/requirements.txt

WORKDIR /usr/src/app 
CMD python /usr/src/app/mnist.py && export AWS_ACCESS_KEY_ID=AKIAIAIVFDMEWXSBBORA && export AWS_SECRET_ACCESS_KEY=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 && aws s3 cp -r /usr/src/logs/mnist_with_summaries s3://usgbc-hiscore-dev/tf-test
