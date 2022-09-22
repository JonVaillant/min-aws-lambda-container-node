FROM public.ecr.aws/lambda/nodejs:16

# Copy function code to the mystery lambda task root directory
COPY index.js ${LAMBDA_TASK_ROOT}

# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
CMD [ "index.handler" ]