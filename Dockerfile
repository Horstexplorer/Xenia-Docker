FROM adoptopenjdk/openjdk16:alpine
RUN apk update &&\ 
    apk upgrade &&\
    apk add --update ttf-dejavu fontconfig &&\
    mkdir /XENIAINSTALL
COPY Xenia-all.jar /XENIAINSTALL/Xenia.jar
COPY EvalHelper.jar /XENIAINSTALL/EvalHelper.jar
RUN cd /XENIAINSTALL &&\
    chmod +x Xenia.jar &&\
    chmod +x EvalHelper.jar &&\
    mkdir -p /xenia/{config, logs} eval

ENTRYPOINT cd /XENIAINSTALL && java -jar Xenia.jar $ARGS
