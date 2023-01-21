FROM jupyter/datascience-notebook:latest

#EXPOSE ${JUPYTER_NOTEBOOK}
EXPOSE ${MERCURY}
EXPOSE ${MERCURY_SERVER_PORT}
EXPOSE ${SSL}
EXPOSE 8000

#COPY ./mercury-notebook.ipynb /home/jovyan/work
#COPY ./CovidFaelle_Altersgruppe.csv /home/jovyan/work

COPY ./mercury-notebook.ipynb /app
COPY ./CovidFaelle_Altersgruppe.csv /app
WORKDIR /app
#COPY ./CovidFaelle_Altersgruppe.csv /home/jovyan/mercury


#CMD ["start-notebook.sh"]
#CMD delete this ine
CMD ["start-notebook.sh", "--NotebookApp.token=''", "--NotebookApp.password=''"]

#USER $NB_USER

RUN python -m pip install mljar-mercury
RUN python -m pip install fastapi
RUN python -m pip install pydantic
RUN python -m pip install uvicorn

#CMD ["mercury", "run", "0.0.0.0:8000"]

#CMD ["mercury", "add", "mercury-notebook.ipynb"]
CMD ["mercury", "run", "0.0.0.0:8000", "mercury-notebook.ipynb"]
