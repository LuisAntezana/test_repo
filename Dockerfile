FROM python:alpine3.16
WORKDIR /app
RUN apk update && apk add git
RUN git clone https://github.com/PhatSriwichai/python-unittest-example
RUN cd python-unittest-example && pip install -r requirements.txt
CMD ["python", "src/myFunction.py"]
