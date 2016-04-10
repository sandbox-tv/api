FROM ubuntu

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

RUN apt-get update && apt-get install -y curl postgresql postgresql-contrib libpq-dev libxml2-dev
RUN curl -O https://raw.githubusercontent.com/rvm/rvm/master/binscripts/rvm-installer
RUN curl -O https://raw.githubusercontent.com/rvm/rvm/master/binscripts/rvm-installer.asc

RUN gpg --verify rvm-installer.asc && bash rvm-installer stable

RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.3.0"
RUN /bin/bash -l -c "gem install bundler"

RUN /etc/init.d/postgresql start && \
    sudo -u postgres psql -c "CREATE USER sandboxtv WITH SUPERUSER PASSWORD 'sandboxtv';" && \
    sudo -u postgres psql -c "UPDATE pg_database SET datallowconn = TRUE WHERE datname = 'template0'; UPDATE pg_database set datistemplate = FALSE WHERE datname = 'template1';" && \
    sudo -u postgres psql -c "DROP DATABASE template1;" && \
    sudo -u postgres psql -c "CREATE DATABASE template1 WITH template = template0 encoding = 'UTF8';" && \
    sudo -u postgres psql -c "UPDATE pg_database set datistemplate = TRUE WHERE datname = 'template1'; UPDATE pg_database SET datallowconn = FALSE WHERE datname = 'template0';"

RUN mkdir /app

COPY . /app
RUN /bin/bash -l -c "cd /app; rvm use 2.3.0 && bundle install"
RUN /bin/bash -l -c "cd /app; rvm use 2.3.0 && /etc/init.d/postgresql start && bundle exec rake db:setup"

CMD /bin/bash -l -c "cd /app; /etc/init.d/postgresql start && rvm use 2.3.0 && rails server -b 0.0.0.0"
