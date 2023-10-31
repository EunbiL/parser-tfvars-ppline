import argparse
import logging
from utils.functions import *


logging.basicConfig(
    level=logging.DEBUG,
    format='%(asctime)s - %(levelname)s - %(message)s',
    datefmt='%Y-%m-%d %H:%M:%S',
)
logger = logging.getLogger(__name__)


def main():

    parser = argparse.ArgumentParser(description='Parse tfvars files.')
    parser.add_argument('--input_tfvars_file', type=str, help='Path to the input tfvars file',required=True)
    parser.add_argument('--dry_run', action='store_true',  help='Execute a dry run')
    parser.add_argument('--accept_changes', action='store_true', help='commit changes')
    args = parser.parse_args()
    
    data = tfvars_to_dict(args.input_tfvars_file)
    modifications  = match_segment(data)
    if args.dry_run:
        logger.info("Executing the code in dry-run mode.")
        dry_run()
        logger.info("Execution in dry-run mode done.")
    if args.accept_changes:
        logger.info("Executing the code.")
        correct_segments(modifications)
        logger.info("Executing Done.")
        logger.info("File created with the new modifications.")

if __name__ == '__main__':
    main()