# Access S3 buckets with RClone

You can access the contents of your S3 bucket(s) inside your Nuvolos applications using the [RClone add-on](../applications/add-ons/rclone-mount-add-on.md).  The steps required to set up your access are:

1. Create AWS Access key for your user
2. Create and attach AWS policy to enable access for your user to the S3 bucket(s)
3. Enable RClone add-on and create config file
4. Set up Nuvolos secrets

## Create AWS Access key

Follow the [AWS documentation](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html) to generate a new access key for your user. You'll need the generated access key and secret key in step 4.

{% hint style="info" %}
For optimal security, we suggest to create a new user for accessing your buckets, which should have only the privileges outlined below.
{% endhint %}

## Create and attach AWS policy

You need to grant access to the user corresponding to the access key to the S3 buckets that you want to use on Nuvolos. There are 2 common scenarios:

### Grant access to multiple S3 buckets

In this case, you want to access multiple buckets in your Nuvolos application at the same time. Below is an [identity-based policy](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_identity-vs-resource.html) template that grants the required privileges for two buckets called `BUCKET_NAME_1` and `BUCKET_NAME_2` :

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket",
                "s3:DeleteObject",
                "s3:GetObject",
                "s3:PutObject",
                "s3:PutObjectAcl"
            ],
            "Resource": [
              "arn:aws:s3:::BUCKET_NAME_1/*",
              "arn:aws:s3:::BUCKET_NAME_1",
              "arn:aws:s3:::BUCKET_NAME_2/*",
              "arn:aws:s3:::BUCKET_NAME_2"
            ]
        },
        {
            "Effect": "Allow",
            "Action": "s3:ListAllMyBuckets",
            "Resource": "arn:aws:s3:::*"
        }
    ]
}
```

{% hint style="info" %}
Note that the connector needs the s3:ListAllMyBuckets action to list all buckets. If you don't explicitly allow the other operations inside the bucket, the connector will not be able to browse their contents.
{% endhint %}

### Grant access to single S3 bucket

In this case, you want to access a single bucket in your Nuvolos application. Below is an [identity-based policy](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_identity-vs-resource.html) template that grants the required privileges for a bucket called `BUCKET_NAME`:

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket",
                "s3:DeleteObject",
                "s3:GetObject",
                "s3:PutObject",
                "s3:PutObjectAcl"
            ],
            "Resource": [
              "arn:aws:s3:::BUCKET_NAME/*",
              "arn:aws:s3:::BUCKET_NAME"
            ]
        }
    ]
}
```

Attach either policy to your user according to [AWS documentation](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_manage-attach-detach.html).

## Enable RClone add-on and create config file

You need to enable the [RClone add-on](../applications/add-ons/rclone-mount-add-on.md) for **every application** separately where you want the S3 buckets mounted. You also need to have the following configuration file at `~/.config/rclone/rclone.conf` in the apps where you need mounting:

<pre class="language-editorconfig"><code class="lang-editorconfig"><strong>[s3]
</strong>type = s3
env_auth = true
provider = AWS
region = &#x3C;region of your bucket, e.g. eu-central-1>
</code></pre>

{% hint style="info" %}
Since HOME areas are the same for all applications in an instance, you only need to create `rclone.conf` per instance
{% endhint %}

## Set up Nuvolos secrets

You need to add your AWS access key to the [Nuvolos secret store](../environment-variables-and-secrets.md#secrets), under the following names:

```
AWS_ACCESS_KEY_ID: <access key>
AWS_SECRET_ACCESS_KEY: <secret key>
```

### Mount a single S3 bucket

If you have followed [grant access to single S3 bucket](access-s3-buckets-with-rclone.md#grant-access-to-single-s3-bucket) to set up your policy, you'll need to tell the RClone add-on to mount that particular bucket only. This can be done by setting the following secret or environment variable:

```
RCLONE_AWS_BUCKET: <BUCKET_NAME>
```

After restarting your application, your AWS bucket(s) will be accesible under `/rclone` on the applications file system.
