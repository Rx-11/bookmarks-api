FROM python:3-alpine3.15
WORKDIR /app
COPY ./requirements.txt ./
RUN pip install -r requirements.txt
COPY  . .
ENV SECRET_KEY="dev"
ENV SQLALCHEMY_DB_URI="sqlite:///bookmarks.db"
ENV JWT_SECRET_KEY="JWT_SECRET_KEY"
EXPOSE 5000
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "src.runner:application"]
