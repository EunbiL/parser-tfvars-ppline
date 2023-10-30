# Tfvars Parser Script

This script is designed to validate segments in  `.tfvars` files based on a predefined naming convention. It utilizes regular expressions and predefined rules to ensure that segment names conform to the specified format.

## Prerequisites

Before using this script, you should have the following requirements in place:

- A `.tfvars` file with segment data following the naming convention.
- The `pyhcl` Python library installed. `pyhcl`  is used to convert `.tfvars` files data to python `dictionaries`.
  You can install it using the following command:

   ```bash
   pip install pyhcl
   ```

## Segment Naming Convention

Segments in the `.tfvars` file should follow the following naming convention:
```bash
POD_OPCO_ENV_EXP_[CLASS][APPCODE][ID]_LS
```

Here's an explanation of each part of the naming convention:

- **POD**: Trigram representing the Point of Delivery (POD). Possible values include:
  - GEP (General POD)
  - SMP (SM POD)
  - WKP (Workplace POD)
  - EXP (External Perimeter Pod)
  - INP (Internal Perimeter Pod)

- **OPCO**: Trigram representing the Operating Company (OPCO). Possible values include:
  - AGO (AxaGO)
  - AFA
  - MUP
  - For the SMP POD, use one of:
    - SVC (Service)
    - MGT (Management)

- **ENV**: Environment specification. Possible values include:
  - PROD (Production)
  - PPRD (Pre-Production)
  - DEVS (Development - Stage)
  - DEVT (Development - Test)
  - NONPROD (Non-Production)
  - SYNC (Sync Loadbalancer)
  - HTBT (Heartbeat)
  - MGMT (Management)

- **EXP**: Exposition indicating whether the segment is for internal (INT) or external (EXT) use. Note that INT and EXT should not be used with SYNC and HTBT.

- **[CLASS]** (Optional DNA Classification): This field is optional and represents the DNA classification. Possible values include:
  - PIC
  - SEC
  - SRV
  - DEVS and DEVT segments do not have a classification.

- **[APPCODE]**:
   - This part of the convention is flexible:
     - For GEP dynamic segments, it should have 6 characters and specify the tier of the segment (PAD, Pres, Application, Data).
     - For other PODs, it should represent the application name with unlimited characters.

- **[ID]**: ID of the segment. In the GEP POD, "01" represents brownfield segments, and "02" represents greenfield segments.

- **LS**: All segments must end with "LS."

This naming convention ensures consistency and conformity in segment naming for the provided Terraform configuration.

## Regular Expression Pattern

To enforce the Segment Naming Convention, the script uses the following regular expression pattern:

```python
POD = r"(GEP|SMP|WKP|EXP|INP)"
OPCO = r"(AGO|AFA|MUP|SVC|AIT|MGT)"
ENV = r"(PROD|PPRD|DEVS|DEVT|NONPROD|SYNC|HTBT|MGMT)"
EXP = r"(INT|EXT)?"
CLASS = r"(PIC|SEC|SRV|C|S)?"
APPCODE = r"([A-Z0-9]{1,6}(_(PAD|Data|Pres|Application))?|([a-zA-Z]+))?"
ID = r"(01|02)?"
LS = r"LS"

Segment_Pattern = fr"^{POD}_{OPCO}_{ENV}_{EXP}_?{CLASS}_?{APPCODE}_?{ID}_?{LS}$"
```
- `POD`: Matches the POD (Point of Delivery), which should be one of the specified trigrams (GEP, SMP, WKP, EXP, INP).

- `OPCO`: Matches the OPCO (Operating Company) using one of the specified trigrams, with specific rules for the SMP POD.

- `ENV`: Matches the ENV (Environment) and ensures it adheres to the allowed values.

- `EXP`: Enforces the Exposition (EXP) to be either INT or EXT and restricts its use with SYNC and HTBT.

- `CLASS`: Handles the optional DNA Classification ([CLASS]) with values PIC, SEC, or SRV, but only for segments other than DEVS and DEVT.

- `APPCODE`: Matches the optional Application Code ([APPCODE]) and its tier (PAD, Pres, Application, Data), with specific rules for GEP segments.

- `ID`: Manages the optional ID ([ID]) and allows for two-digit values, specifying whether a GEP segment is brownfield or greenfield.

- `LS`: Ensures that all segment names must end with "LS."



## Usage

To use the Script, follow these steps:


1. Execute the Script:
  - ```bash
    python tfvars_parser.py --input_tfvars_file file.tfvars
    ```
2. If no errors, `output.tfvars` file should apear in the current directory.






