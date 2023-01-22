FROM jupyter/datascience-notebook:latest

EXPOSE 8000

WORKDIR /app

COPY ./requirements.txt /app
COPY ./mercury-notebook.ipynb /app
COPY ./CovidFaelle_Altersgruppe.csv /app

RUN pip install -r requirements.txt

CMD ["mercury", "run", "0.0.0.0:8000", "mercury-notebook.ipynb"]
