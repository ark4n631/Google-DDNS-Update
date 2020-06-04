FROM python:3.6.10-alpine3.11

WORKDIR /app

RUN adduser -D -H -s /bin/bash newuser && \
    mkdir -p /app/

COPY . /app

COPY ./ddns-update.conf /etc/ddns-update.conf
COPY ./ddns-update ddns-update.py
RUN touch /var/log/ddns-update.log
RUN chown newuser:newuser /var/log/ddns-update.log
RUN chown newuser:newuser /etc/ddns-update.conf
RUN chown -R newuser /app
USER newuser
CMD ["python", "ddns-update.py"]
