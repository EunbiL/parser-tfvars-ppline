import re
import hcl
from utils.functions import *
from utils.vars import *
from utils.checks import *
from tabulate import tabulate



def printhcl(mydict, ident=False):
    """
    Produces a multi-line string for use in terraform tfvars file from a dictionary
    :param mydict: Dict
    :param ident: Should the lines be idented or not
    :return s: Multi-line String in hcl format
    """

    s = ""
    for key, val in mydict.items():
        if ident:
            s += '\t'
        if isinstance(val, dict):
            if len(val) > 0:
                s += '{0} = {1}\n'.format(key, '{\n' + str(printhcl(val, ident=True)) + '\n}')
        elif isinstance(val, str):
            if ident:
                if key != 'value':
                    k = '"{}"'.format(key)
                else:
                    k = key
            else:
                k = key
            s += '{0} = {1}\n'.format(k, '"' + str(val) + '"')
        elif isinstance(val, list):
            if val == []:
                s += key + ' = []\n'
            else:    
                s += key + ' = [\n'
                for i in val:
                    if ident:
                        s += '\t'
                    if isinstance(i, dict):
                        s += '\t{' + str(printhcl(i, ident=True)).strip() + '},\n'
                    else:
                        s += '\t"{}",\n'.format(i)
                s = s[0:-2]
                s += '\n]\n'
        elif val is None:
            if ident:
                s += '"{0}" = {1}\n'.format(key, '""')
            else:
                s += '{0} = {1}\n'.format(key, '""')
        else:
            if ident:
                k = '"{}"'.format(key)
            else:
                k = key
            s += '{0} = {1}\n'.format(k, str(val).lower())
    return s

def tfvars_to_dict(tfvars_file):
    ''' This function converts the tfvars file into a dictionary.'''
    with open(tfvars_file, 'r') as f:
        tfvars_data = f.read()
    tfvars_dict = hcl.loads(tfvars_data)
    return  tfvars_dict    
 





def match_segment(data):
    import copy
    data2 = copy.deepcopy(data)
    global segments
    segments = []
    for map in [key for key in data if "segment" in key]:
        for segment in list(data2[map].keys()):  
            match = re.match(Segment_Pattern, segment)
            if match or not match:
                
                if check_ls(segment):
                    reason = 'A segment must end with LS'
                    good_segment = check_ls(segment)
                    segments.append([segment,good_segment,reason])
                    data2[map][good_segment] = data2[map].pop(segment)
                    
                if check_exp(segment):
                    reason = 'EXPs: INT,EXT is not used with ENVs: SYNC,HTBT'
                    good_segment = check_exp(segment)
                    segments.append([segment,good_segment,reason])
                    data2[map][good_segment] = data2[map].pop(segment)
                    
                if check_class(segment):
                    reason = 'Classes: PIC,SEC,SRV,S,C is not used with ENVs: DEVS, DEVT'
                    good_segment = check_class(segment)
                    segments.append([segment,good_segment,reason])
                    data2[map][good_segment] = data2[map].pop(segment)
                    
    return data2
                     

def correct_segments(data):
    data2 = match_segment(data)
    datahcl = printhcl(data2)
    file = 'output.tfvars'
    with open(file,'w') as fr:
        fr.write(datahcl)



def table_print(table):
    headers = ['Bad Segment','Corrected Segment','Convention Error'] 
    print(tabulate(table, headers, tablefmt="fancy_grid"))
    
def dry_run():
    table = []
    for segment in segments:
        table+=[segment]
    table_print(table)
    


    
    
