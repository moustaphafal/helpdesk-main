FROM java:openjdk-8



#Installation du runner
RUN curl -L --output /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64
RUN chmod +x /usr/local/bin/gitlab-runner
RUN useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash
RUN gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner

#installation de maven

RUN cd /opt/
RUN curl -L --output /opt/apache-maven-3.6.0-bin.zip https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/3.6.0/apache-maven-3.6.0-bin.zip
RUN unzip apache-maven-3.6.0-bin.zip

# RUN gitlab-runner start
# RUN gitlab-runner register --url http://www.dic3devops.com/ --registration-token GR1348941D8PDoQ-m1U2LwMiYshUH
# gitlab runner verify


CMD ["/bin/bash"]
