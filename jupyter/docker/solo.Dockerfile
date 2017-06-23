FROM mxnet/python

RUN apt-get install libboost-python-dev -y
RUN apt-get install graphviz -y
RUN apt-get install supervisor -y

ADD docker/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD docker/requirements.txt /usr/src/install/requirements.txt
ADD docker/jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

RUN pip install --no-cache-dir -r /usr/src/install/requirements.txt

WORKDIR /usr/src/notebooks
CMD jupyter notebook --ip 0.0.0.0 --allow-root