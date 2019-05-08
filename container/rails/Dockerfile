FROM ruby:2.5

RUN apt update -y
RUN apt upgrade -y
RUN apt install git -y

RUN git clone https://github.com/Distil62/projet-listing-ruby-titouis.git project
RUN cd project

RUN ls project

# RUN bundle install --path /project/

ADD ./init.sh /init.sh
RUN chmod 755 /init.sh

CMD ["/init.sh"]
