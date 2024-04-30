IMAGE_NAME = gpu-enabled-jupyterlab-cuda11.8.0-devel-ubuntu22.04
NOTEBOOK_DIR_NAME = notebook
DATA_DIR_NAME = data

IMAGE:
	docker build --no-cache -t $(IMAGE_NAME) .

$(NOTEBOOK_DIR_NAME):
	mkdir -p $(NOTEBOOK_DIR_NAME)

$(DATA_DIR_NAME):
	mkdir -p $(DATA_DIR_NAME)

RUN-CONSOLE:
	docker run -it --rm --gpus all -p 8888:8888 $(IMAGE_NAME)

RUN-JUPYTERLAB: notebook data
	docker run --rm -it --gpus all -p 8888:8888 --mount type=bind,src="$(shell pwd)/$(NOTEBOOK_DIR_NAME)",dst=/$(NOTEBOOK_DIR_NAME) --mount type=bind,src="$(shell pwd)/$(DATA_DIR_NAME)",dst=/$(DATA_DIR_NAME) $(IMAGE_NAME) jupyter-lab --allow-root --ip=* --notebook-dir=/$(NOTEBOOK_DIR_NAME)
