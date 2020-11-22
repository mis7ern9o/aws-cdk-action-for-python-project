# GitHub Action for AWS CDK

This Action for [AWS CDK](https://docs.aws.amazon.com/cdk/index.html) allow you to build your python layer in an amazon linux 2 docker image (so you will get native libs optimized for your lambda runtime environment), and allow you to run the cdk command you needs (cdk synth, npx cdk deploy, ...) after you build your python layer.

_Currently supports CDK apps using Typescript cdk, and python projects_

*This Github Action is specifically based on the Amazon Linux distribution to ensure Python dependencies, compiled to C, are functional when deployed to AWS Lambda.

## Usage

An example workflow for building a layer zip archive, and synthesizing an AWS CloudFormation template for your app using `cdk synth`.

```yaml
name: AWS CDK Synth

on: [push]

jobs:
  aws-cdk-synth:

    runs-on: ubuntu-latest

    steps:
    - name: Checkout
      uses: actions/checkout@v2

    - name: CDK Synth
      uses: muldos/github-action-aws-cdk-amazon-linux@master
      with:
        python_build_command: 'pip3 install -r requirements.txt -t dist/layer/python/lib/python3.8/site-packages'
        zip_layer_command: 'zip -r dist/layer/third-parties-layer.zip dist/layer/python'
        cdk_command: 'npx cdk synth'
        cdk_work_dir: 'deploy'
      env:
        AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
        AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        AWS-DEFAULT_REGION: 'eu-west-1'
```

### Secrets

- `AWS_ACCESS_KEY_ID` – **Required** The AWS access key part of your credentials ([more info](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys))
- `AWS_SECRET_ACCESS_KEY` – **Required** The AWS secret access key part of your credentials ([more info](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys))

For details on creating secrets and using them with GitHub Actions, see [Creating encrypted secrets for a repository](https://docs.github.com/en/actions/configuring-and-managing-workflows/creating-and-storing-encrypted-secrets#creating-encrypted-secrets-for-a-repository).

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).

Container images built with this project include third party materials. See [THIRD_PARTY_NOTICE.md](THIRD_PARTY_NOTICE.md) for details.

## Credits

Many thanks to Scott Brenner and Greg Farrow for their [original Github Action(s)](https://github.com/ScottBrenner/aws-cdk-action) which this action is based on.

