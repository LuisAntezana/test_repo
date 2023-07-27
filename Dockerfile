#FROM python:alpine3.16
#WORKDIR /app
#RUN apk update && apk add git
#RUN git clone https://github.com/PhatSriwichai/python-unittest-example
#RUN cd python-unittest-example && pip install -r requirements.txt
#CMD ["python", "src/myFunction.py"]

FROM mcr.microsoft.com/dotnet/sdk:5.0
WORKDIR /app
#RUN apk update && apk add git
#RUN git clone https://github.com/PhatSriwichai/python-unittest-example
#RUN cd python-unittest-example && pip install -r requirements.txt
#CMD ["python", "src/myFunction.py"]
ARG API_KEY
ARG URL
RUN echo $API_KEY
RUN /usr/share/dotnet/dotnet nuget push **/*.nupkg -k $API_KEY -s $URL --force-english-output --skip-duplicate
