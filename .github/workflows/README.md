# GitHub Actions Demo for parser-tfvars

## Description
This repository contains a GitHub Actions workflow that performs a dry run parser for checking the tfvars file and creating output files from the parser. If there are some incorrect segments, it will show you them and stop in order to demande reviewer's validation for accepting modifications. The workflow demonstrates various stages such as checking for the tfvars file, installing necessary dependencies, running the script, and uploading the modified tfvars file.

## Workflow Details

### Workflow Algorithm Diagram

```
+-----------+ 
|   Start   |
+-----------+
    |
    v
+----------------------------+
| Job1 : Checkout-repository |
+----------------------------+
    |
    v
+-----------------------+          +-----------+
| Job2 : Dry-run-parser |   -- >   |   Finish  |
+-----------------------+          +-----------+
    |
    | (If you want to accept modifications)
    v
+----------------------------+
| Job3 : Accept-modification |
+----------------------------+
    |
    v
+----------+
|  Finish  |
+----------+
``````

### Workflow Structure
The workflow is structured into the following stages:

1. Checkout-repository: Checks out the repository code and lists the files in the repository.
2. Dry-run-parser: Initiates the dry run parser for the tfvars file. It checks for the existence of the tfvars file, installs necessary dependencies, and performs a dry run of the tfvars_parser.py script.
3. Accept-modification: If you agree with the modification from the second job, it will continue 
the pipeline to apply the changes. The applied output file is saved in artifact.

### Workflow Steps

- Checkout Repository: Checks out the repository code.
- Check for tfvars File: Checks for the existence of the tfvars file.
- Install Dependencies: Installs the necessary dependencies, pyhcl and tabulate.
- Dry Run Parser: Conducts a dry run of the tfvars_parser.py script with --dry_run option.
- Download All Files: Downloads the shared files artifact in later jobs.
- Accept Modification: Accepts modifications to the tfvars file using --accept_changes option.
- Print Output tfvars File: Prints the contents of the output.tfvars file.
- Upload Output File: Uploads the output.tfvars file as a shared artifact.

## Usage
To use this workflow, follow the steps below:
1. Go to the repository of your GitHub account.
2. Go to Actions
3. Click `GitHub Actions Demo for parser-tfvars` workflow
4. Click `Run workflow` with branch from that you want to trigger
5. If you are the one of reviewers, you will receive a notification in email to see the result of dry_run or accept the modifications.

