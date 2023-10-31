# GitHub Actions Demo for parser-tfvars

## Description
This repository contains a GitHub Actions workflow that performs a dry run parser for the tfvars file and accepts modifications, using the parser-tfvars script. The workflow demonstrates various stages such as checking for the tfvars file, installing necessary dependencies, running the script, and uploading the modified tfvars file.

## Workflow Details

### Workflow Structure
The workflow is structured into the following stages:

1. Checkout-repository: Checks out the repository code and lists the files in the repository.
2. Dry-run-parser: Initiates the dry run parser for the tfvars file. It checks for the existence of the tfvars file, installs necessary dependencies, and performs a dry run of the tfvars_parser.py script.
3. Accept-modification: Downloads the shared files artifact, checks for the tfvars file, installs required dependencies, and accepts modifications to the tfvars file using the tfvars_parser.py script. It then prints the output.tfvars file and uploads it as an artifact.

### Workflow Steps
Step 1: Checkout Repository: Checks out the repository code.
Step 2: Dry Run Parser: Conducts a dry run of the tfvars_parser.py script.
Step 3: Download All Files: Downloads the shared files artifact.
Step 4: Change Directory and List Files: Changes the directory to the repository workspace and lists the files.
Step 5: Check for tfvars File: Checks for the existence of the tfvars file.
Step 6: Install Dependencies: Installs the necessary dependencies, pyhcl and tabulate.
Step 7: Accept Modification: Accepts modifications to the tfvars file using the tfvars_parser.py script.
Step 8: Print Output tfvars File: Prints the contents of the output.tfvars file.
Step 9: Upload Output File: Uploads the output.tfvars file as a shared artifact.

## Usage
To use this workflow, follow the steps below:
Fork this repository to your GitHub account.
Make necessary modifications to the tfvars file.
Trigger the workflow manually using the workflow_dispatch event.
Review the output and the modified output.tfvars file.

## License
This project is licensed under the MIT License.
Feel free to contribute or use this project as per the terms of the license.
