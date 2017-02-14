Demo of how to serve a jupyter notebook backed by S3 using s3fs as the file system emulator/adapter
The ec2 instance should have a IAM profile that gives access to the target s3 bucket

Building the image...
docker build -t mys3fs .

Running the image...
docker run --rm -it --env-file my.env --privileged -p 8888:8888 mys3fs

You would then hit your instance with a url like so: http://<ec2-ip-addr>:8888/?token=<token from env file>


You can run multiple copies of the image on the same ec2 host. Just change up the port numbers. Also want to pass another env file that has a different bucket. Behavior of two processes attached to the same s3 bucket is undefined / unknown
docker run --rm -it --env-file my2.env --privileged -p 8889:8888 mys3fs


