# -*- coding: utf-8 -*-
"""
Created on Fri Aug  7 05:52:48 2020

@author: EliasMH
"""



from rdkit import Chem
from rdkit.Chem import Draw
from rdkit.Chem.Draw import rdMolDraw2D
from rdkit.Chem import rdDepictor
rdDepictor.SetPreferCoordGen(True)
from matplotlib.cm import get_cmap
from collections import defaultdict
from xlwings import func, arg

colors = get_cmap('tab20')

@func
@arg('comms', numbers=int)
def draw_moleculeModules(smi, comms, molName):
    if type(comms) == str:
        comms=comms.strip().split(',')
        map_object = map(int, comms)
        comms = list(map_object)
    m=Chem.MolFromSmiles(smi)
    atomcomm=comms
    molatms=list(m.GetAtoms())
    #molbonds=list(m.GetBonds())
    #hit_ats=[]
    #hit_bonds=[]
    #hit_ats=[0,1,6]
    #hit_bonds=[0,5]
    athighlights2 = defaultdict(list)
    arads2 = {}
    bndhighlights2 = defaultdict(list)
    for bond in m.GetBonds():
        beginid=bond.GetBeginAtomIdx()
        endid=bond.GetEndAtomIdx()
        aid1=molatms[beginid].GetIdx()
        aid2=molatms[endid].GetIdx()
        bid=m.GetBondBetweenAtoms(aid1,aid2).GetIdx()
        #print('bondid:',bid)
        #print('s,t:', beginid, endid)
        if atomcomm[beginid] == atomcomm[endid]:
            atcomm=atomcomm[beginid]
    
            #hit_ats.append(aid1)
            #hit_ats.append(aid2)
            #print(atcomm)
            #print(colors(atcomm))
            #hit_bonds.append(bid)
            athighlights2[aid1].append(colors(atcomm))
            athighlights2[aid2].append(colors(atcomm))
            arads2[aid1] = 0.3
            arads2[aid2] = 0.3
            bndhighlights2[bid].append(colors(atcomm))
    
        else:
            bndhighlights2[bid].append((0.6,0.6,0.6))
    
    dm2=Draw.PrepareMolForDrawing(m)
    d3d = rdMolDraw2D.MolDraw2DCairo(400, 400)
    dos2 = d3d.drawOptions()
    dos2.atomHighlightsAreCircles = False
    dos2.fillHighlights=True
    #dos2.addAtomIndices=True
    #dos2.highlightBondWidthMultiplier=2
    
    d3d.DrawMoleculeWithHighlights(dm2, molName, dict(athighlights2), dict(bndhighlights2), arads2, {})
    #dict(bndhighlights2)
    d3d.FinishDrawing()
    outputf2 = d3d.WriteDrawingText(molName + '.png')
    
    return outputf2

@func
@arg('comms', numbers=int)
def comm_type(comms):
    if type(comms) == int:
        t='integer'
    elif type(comms) == str:
        t='string'
    elif type(comms) == list:
        t='list'
    else:
        t='other'
    return t
