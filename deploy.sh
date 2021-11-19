docker build -t raju6713/multi-fibonacci-client:latest -t raju6713/multi-fibonacci-client:$SHA -f ./client/Dockerfile ./client
docker build -t raju6713/multi-fibonacci-server:latest -t raju6713/multi-fibonacci-server:$SHA -f ./server/Dockerfile ./server
docker build -t raju6713/multi-fibonacci-worker:latest -t raju6713/multi-fibonacci-worker:$SHA -f ./worker/Dockerfile ./worker
docker push raju6713/multi-fibonacci-client:latest
docker push raju6713/multi-fibonacci-server:latest
docker push raju6713/multi-fibonacci-worker:latest
docker push raju6713/multi-fibonacci-client:$SHA
docker push raju6713/multi-fibonacci-server:$SHA
docker push raju6713/multi-fibonacci-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/client-deployment client=raju6713/multi-fibonacci-client:$SHA
kubectl set image deployments/server-deployment server=raju6713/multi-fibonacci-server:$SHA
kubectl set image deployments/worker-deployment worker=raju6713/multi-fibonacci-worker:$SHA