IMAGE_NAME := gpu-enabled-jupyterlab-cuda12.4.0-runtime-ubuntu22.04

IMAGE:
	docker build --no-cache -t $(IMAGE_NAME) .

RUN-CONSOLE:
	docker run -it --rm --gpus all -p 8888:8888 $(IMAGE_NAME)

RUN-JUPYTERLAB:
	mkdir -p src
	mkdir -p notebook
	docker run --rm -it --gpus all -p 8888:8888 --mount type=bind,src="$(shell pwd)/notebook",dst=/notebook --mount type=bind,src="$(shell pwd)/src",dst=/src $(IMAGE_NAME) jupyter-lab --allow-root --ip=* --notebook-dir=/notebook/