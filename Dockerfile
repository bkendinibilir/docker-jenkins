FROM jenkins:2.32.2-alpine
LABEL maintainer "Benjamin Kendinibilir <bkendinibilir@mac.com>"

ENV JENKINS_UC_DOWNLOAD http://jenkins.mirror.isppower.de/

RUN /usr/local/bin/install-plugins.sh kubernetes:0.10 workflow-aggregator:2.5 credentials-binding:1.10 git:3.0.1 \
    && mkdir -p /usr/share/jenkins/ref/secrets/ \
    && echo "false" > /usr/share/jenkins/ref/secrets/slave-to-master-security-kill-switch