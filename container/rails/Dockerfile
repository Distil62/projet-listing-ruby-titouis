FROM ruby:2.5-alpine

RUN apk update
RUN apk upgrade
RUN apk add git

RUN git clone https://github.com/Distil62/projet-listing-ruby-titouis.git project
RUN cd project
RUN bundle install

ADD ./init.sh /init.sh
RUN chmod 755 /init.sh

CMD ["/init.sh"]
