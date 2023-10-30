from utils.vars import *

def check_exp(segment):
    
    segment = segment.split('_')
    if segment[2] == 'SYNC' or segment[2] == 'HTBT':
        exp = [e for e in EXP if e in segment]
        if exp != []:
            segment.remove(exp[0])
            correct_segment = '_'.join(segment)
            
            return correct_segment
   

def check_class(segment):
    segment = segment.split('_')
    if segment[2] == 'DEVS' or segment[2] == 'DEVT':
        clss = [c for c in CLASS if c in segment]
        if clss != []:
            segment.remove(clss[0])
            correct_segment = '_'.join(segment)
            
            return correct_segment
        
def check_ls(segment):
    segment = segment.split('_')
    if segment[-1] != "LS":
        segment[-1] = "LS"
        correct_segment = '_'.join(segment)
        
        return correct_segment
    