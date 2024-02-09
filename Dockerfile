FROM nvcr.io/nvidia/tritonserver:21.09-py3

# Load yolo model
COPY yolov5s.engine /models/yolov5/1/model.plan

COPY libmyplugins.so /plugins/libmyplugins.so 

# Load retina model
COPY retina_r50.engine /models/retinaface/1/model.plan

COPY libdecodeplugin.so /plugins/libdecodeplugin.so 

# Load yolo preprocess dali
COPY yolo_preprocess /models/yolo_preprocess 

# Load yolo ensemble 
COPY yolo_ensemble /models/yolo_ensemble 

# Load retina preprocess dali
COPY retina_preprocess /models/retina_preprocess 

# Load retina ensemble 
COPY retina_ensemble /models/retina_ensemble 


ENV LD_PRELOAD="/plugins/libmyplugins.so\ /plugins/libdecodeplugin.so"

ENTRYPOINT tritonserver --model-repository=/models --strict-model-config=false --grpc-infer-allocation-pool-size 16

