FROM centos:7.2.1511

RUN yum install -y git \
&& yum install -y epel-release \
&& yum install -y nodejs

RUN cd / \
&& git clone https://github.com/person896/snapdrop.git

RUN cd /snapdrop && npm install -g yarn
RUN cd /snapdrop && yarn start
RUN cd /snapdrop && yarn run lerna -- run wct --stream -- -- -p
RUN cd /snapdrop && yarn run lerna publish --skip-npm --conventional-commits
RUN cd /snapdrop && git push --follow-tags

EXPOSE 3002

WORKDIR /snapdrop

CMD [ "bash", "start.sh" ]