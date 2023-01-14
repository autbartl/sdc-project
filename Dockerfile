FROM jupyter/datascience-notebook:latest

EXPOSE ${WEBSITES_PORT}

CMD ["start-notebook.sh", "--NotebookApp.token=''", "--NotebookApp.password=''"]

USER $NB_USER

RUN python -m pip install mljar-mercury
RUN python -m pip install fastapi
RUN python -m pip install pydantic
RUN python -m pip install uvicorn
