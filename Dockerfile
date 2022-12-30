FROM jupyter/datascience-notebook:latest

EXPOSE ${JUPYTER_NOTEBOOK}
EXPOSE ${MERCURY}
EXPOSE ${FASTAPI}
EXPOSE ${MERCURY_SERVER_PORT}
EXPOSE ${SSL}

USER $NB_USER

RUN python -m pip install mljar-mercury
RUN python -m pip install fastapi
RUN python -m pip install pydantic
RUN python -m pip install uvicorn

EXPOSE 8000

CMD mercury run 0.0.0.0:8000 exercise3-bartl.ipynb
