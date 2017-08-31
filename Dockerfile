FROM microsoft/powershell:latest

RUN apt-get update && apt-get install git -y --no-install-recommends \
	&& apt-get clean && rm -rf /var/lib/apt/lists/*