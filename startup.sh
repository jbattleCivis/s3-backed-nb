s3fs -o iam_role=auto $BUCKET_NAME /mnt/s3_mountpoint
echo 'S3 bucket mounted, starting notebook'
/root/anaconda3/bin/jupyter notebook --ip=0.0.0.0 --notebook-dir=/mnt/s3_mountpoint --NotebookApp.token=$TOKEN_VAL

