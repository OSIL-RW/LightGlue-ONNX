echo "Export the ONNX model with the LightGlue-ONNX repository."

uv sync 
uv pip install .

source .venv/bin/activate

uv pip install onnx onnxruntime onnxscript opencv-python sympy typer torch "numpy<2"

python dynamo.py export superpoint \
  --num-keypoints 1024 \
  -b 2 -h 3280 -w 2464 \
  -o weights/superpoint_lightglue_pipeline.onnx