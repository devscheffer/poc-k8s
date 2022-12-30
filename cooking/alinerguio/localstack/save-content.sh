aws='aws --profile localstack --endpoint-url=http://localhost:31000'

DIR="s3-buckets/raw"
if [ ! -d "$DIR" ]; then
  mkdir "$DIR"
fi
$aws s3 cp --recursive s3://raw "$DIR"

DIR="s3-buckets/trusted"
if [ ! -d "$DIR" ]; then
  mkdir "$DIR"
fi
$aws s3 cp --recursive s3://trusted "$DIR"

DIR="s3-buckets/analytic"
if [ -d "$DIR" ]; then
  mkdir "$DIR"
fi
$aws s3 cp --recursive s3://analytic "$DIR" 