FROM slobo/carton:5.20.2-1.0.19

COPY src/cpanfile src/*.pl /src/
RUN cd /src && carton

ENV PERL5LIB=/src/local/lib/perl5

