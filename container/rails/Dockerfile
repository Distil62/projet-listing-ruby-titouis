FROM ruby:2.5-alpine

RUN apk update -y
RUN apk upgrade -y
RUN apk install git -y

RUN git clone https://github.com/Distil62/projet-listing-ruby-titouis.git project
RUN cd project
RUN bundle install

CMD ["/init.sh"]
