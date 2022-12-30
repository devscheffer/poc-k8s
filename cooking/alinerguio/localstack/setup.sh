aws configure set aws_access_key_id ACCESSKEYAWSUSER
aws configure set aws_secret_access_key sEcreTKey
aws configure set aws_default_region us-west-2

aws='aws --profile localstack --endpoint-url=http://localhost:31000'

$aws s3api create-bucket --bucket raw
$aws s3api put-bucket-acl --bucket raw --acl public-read

DIR="s3-buckets/raw"
if [ -d "$DIR" ]; then
  $aws s3 cp --recursive "$DIR" s3://raw
fi

$aws s3api create-bucket --bucket trusted
$aws s3api put-bucket-acl --bucket trusted --acl public-read

DIR="s3-buckets/trusted"
if [ -d "$DIR" ]; then
  $aws s3 cp --recursive "$DIR" s3://trusted
fi

$aws s3api create-bucket --bucket analytic
$aws s3api put-bucket-acl --bucket analytic --acl public-read

DIR="s3-buckets/analytic"
if [ -d "$DIR" ]; then
  $aws s3 cp --recursive "$DIR" s3://analytic
fi