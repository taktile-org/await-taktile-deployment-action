FROM python:3.7-slim

RUN apt update && apt install jq -y

RUN pip install taktile-cli==0.5.26

COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]