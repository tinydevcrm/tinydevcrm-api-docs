# `tinydevcrm-api-docs`: API documentation for TinyDevCRM

This repository should specify how the API `api.tinydevcrm.com`, as per the
[GitHub repository](https://github.com/tinydevcrm/tinydevcrm-backend) works.

This framework uses `hugo` and the `hugo` theme `docuapi` static website
generation and UI/UX.

## Getting Started

1.  Clone this repository, and `cd` into it:

    ```bash
    git clone https://github.com/tinydevcrm/tinydevcrm-api-docs
    cd tinydevcrm-api-docs
    ```

2.  Run through `make check` in order to ensure that system-required
    dependencies are installed, searchable, and match the declared version or
    higher:

    ```bash
    make check
    ```

3.  Setup the development environment (a Docker container context where commands
    are lifted into):

    ```bash
    make setup
    ```

    The website should be available at http://localhost:1320.

4.  Run the development server:

    ```bash
    make start
    ```

## Deploying to AWS

1.  To create the AWS CloudFormation stack, run:

    ```bash
    make create-infra
    ```

2.  To deploy a different version of the CloudFormation stack, run:

    ```bash
    make deploy-infra
    ```

3.  To teardown the CloudFormation stack, run:

    ```bash
    make terminate-infra
    ```

4.  To deploy content to AWS, run:

    ```bash
    make deploy-content
    ```
