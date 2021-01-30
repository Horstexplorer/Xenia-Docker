FROM adoptopenjdk/openjdk13:alpine
RUN apk update &&\ 
    apk upgrade &&\
    mkdir /XENIAINSTALL &&\
    cd /XENIAINSTALL &&\
    wget "https://ci.netbeacon.de/repository/download/Xenia_Bot/latest.lastSuccessful/Xenia-all.jar?guest=1" -O "Xenia.jar" &&\
    wget "https://ci.netbeacon.de/repository/download/Xenia_Bot/latest.lastSuccessful/EvalHelper.jar?guest=1" -O "EvalHelper.jar" &&\
    chmod +x Xenia.jar &&\
    chmod +x EvalHelper.jar &&\
    mkdir -p /xenia/{config, logs} eval

ENTRYPOINT cd /XENIAINSTALL && java -jar Xenia.jar $ARGS
