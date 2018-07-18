build:
	rm -rf public
	hugo

deploy: build
	aws s3 sync public/ s3://ryanesparza.com --acl public-read --delete
	aws configure set preview.cloudfront true
	aws cloudfront create-invalidation --distribution-id E7KMJ533OC9S8 --paths '/*'
