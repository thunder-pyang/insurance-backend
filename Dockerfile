FROM python:3.9-slim
ENV PIP_DISABLE_PIP_VERSION_CHECK=on
RUN pip install poetry
WORKDIR /app
COPY poetry.lock pyproject.toml /app/
RUN poetry install
COPY . .
CMD ["poetry", "run", "uvicorn", "main:app", "--host", "0.0.0.0"]
