import argparse

from utils.functions import *

def main():
    parser = argparse.ArgumentParser(description='Parse tfvars files.')
    parser.add_argument('--input_tfvars_file', type=str, help='Paths to the input tfvars file',required=True)
    args = parser.parse_args()
    data = tfvars_to_dict(args.input_tfvars_file)
    match_segment(data)
    
              

if __name__ == '__main__':
    main()