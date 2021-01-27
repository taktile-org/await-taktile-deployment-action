FROM python:3.7-slim

RUN pip install taktile-cli==0.3.15

COPY run.sh /run.sh
RUN chmod +x /run.sh

RUN apt update && apt install jq -y

ENTRYPOINT ["/run.sh"]