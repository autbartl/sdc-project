FROM jupyter/datascience-notebook:latest

EXPOSE 80
EXPOSE 443

USER $NB_USER

RUN python -m pip install mljar-mercury
RUN python -m pip install fastapi
RUN python -m pip install pydantic
RUN python -m pip install uvicorn
