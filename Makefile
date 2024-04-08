IMAGE:
	docker build --no-cache -t gpu-enabled-ubuntu-20.04-jupyterlab-base .

RUN-CONSOLE:
	docker run -it --rm --gpus all -p 8888:8888 gpu-enabled-ubuntu-20.04-jupyterlab-base

RUN-JUPYTERLAB:
	mkdir -p src
	mkdir -p notebook
	docker run --rm -it --gpus all -p 8888:8888 --mount type=bind,src="$(shell pwd)/notebook",dst=/notebook --mount type=bind,src="$(shell pwd)/src",dst=/src gpu-enabled-ubuntu-20.04-jupyterlab-base jupyter-lab --allow-root --ip=* --notebook-dir=/notebook/