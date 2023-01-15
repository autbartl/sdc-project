FROM jupyter/datascience-notebook:latest

EXPOSE ${JUPYTER_NOTEBOOK}
EXPOSE ${MERCURY}
EXPOSE ${MERCURY_SERVER_PORT}
EXPOSE ${SSL}

COPY ./exercise3-bartl.ipynb /home/jovyan/work
COPY ./CovidFaelle_Altersgruppe.csv /home/jovyan/work

CMD ["start-notebook.sh", "--NotebookApp.token=''", "--NotebookApp.password=''"]


USER $NB_USER

RUN python -m pip install mljar-mercury
RUN python -m pip install fastapi
RUN python -m pip install pydantic
RUN python -m pip install uvicorn
