FROM jupyter/datascience-notebook:latest

#EXPOSE ${JUPYTER_NOTEBOOK}
EXPOSE ${MERCURY}
EXPOSE ${MERCURY_SERVER_PORT}
EXPOSE ${SSL}
EXPOSE 8000

WORKDIR /app


COPY ./mercury-notebook.ipynb /app
COPY ./CovidFaelle_Altersgruppe.csv /app

#CMD ["start-notebook.sh", "--NotebookApp.token=''", "--NotebookApp.password=''"]

#USER $NB_USER

RUN pip install -r requirements.txt

CMD ["mercury", "run", "0.0.0.0:8000", "mercury-notebook.ipynb"]
