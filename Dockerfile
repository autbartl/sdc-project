FROM jupyter/datascience-notebook:latest

EXPOSE ${MERCURY}
EXPOSE ${JUPYTER_NOTEBOOK}
EXPOSE ${MERCURY_SERVER_PORT}
EXPOSE ${SSL}
#EXPOSE 8000

COPY ./mercury-notebook.ipynb /home/jovyan/work
COPY ./CovidFaelle_Altersgruppe.csv /home/jovyan/work

COPY ./mercury-notebook.ipynb /home/jovyan/mercury
#COPY ./CovidFaelle_Altersgruppe.csv /home/jovyan/mercury


#CMD ["start-notebook.sh"]
CMD ["start-notebook.sh", "--NotebookApp.token=''", "--NotebookApp.password=''"]

USER $NB_USER

RUN python -m pip install mljar-mercury
RUN python -m pip install fastapi
RUN python -m pip install pydantic
RUN python -m pip install uvicorn

CMD ["python", "mercury", "run", "0.0.0.0:8000", "mercury-notebook.ipynb"]
