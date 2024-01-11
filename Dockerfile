FROM meltano/meltano:v2.16.1-python3.9

COPY . .

RUN meltano install

ENV NO_COLOR=1

ENTRYPOINT [ "meltano", "run" ]
CMD [ "tap-salesforce", "salesforce-obfuscate-sensitive-data", "target-postgres" ]
