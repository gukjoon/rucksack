FROM mxnet/python

RUN apt-get install libboost-python-dev -y
RUN apt-get install graphviz -y
ADD docker/requirements.txt /usr/src/install/requirements.txt
RUN pip install --no-cache-dir -r /usr/src/install/requirements.txt

WORKDIR /usr/src/notebooks
CMD jupyter notebook --ip 0.0.0.0 --allow-root