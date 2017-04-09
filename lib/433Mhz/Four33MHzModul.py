#!/usr/bin/env python
# coding: utf8

import yaml
import os
import subprocess

try:
    from ipHelp import IPS, ST, ip_syshook, dirsearch, sys
    IPH = True
except ImportError:
    print 'ipHelp nicht gefunden'
    IPH = False
    

UTILSPATHSEND = '433/433Utils/RPi_utils/sendcode'
HOME = os.getenv("HOME")
if HOME not in UTILSPATHSEND:
    UTILSPATHSEND = os.pth.join(HOME, UTILSPATHSEND)


class Four33MHzModul:

    def __init__(self, configPath = ''):

        self.configPath = configPath
        self.devices = {}
        self.ReadConfig()


    def ReadConfig(self):
        try:
            with open(self.configPath, 'r') as f:
                devicesDict = yaml.load(f)
        except:
            print "Could not find config file at %s.", (self.configPath)


        for dd in devicesDict.keys(): 

            f33 = Four33MhzDevice(dd,devicesDict[dd])
            self.devices[dd] = f33


    def Action(self,device,button):
        
        code = self.devices[device].GetButtonCode(button)

        for i in range(3):

            subprocess.call(UTILSPATHSEND, code)
        


class Four33MhzDevice:

    def __init__(self, name, buttons = {}):

        self.buttons = buttons
        

    def CreateButton(self, name, code):

        self.buttons[name] = code

    def GetButtonCode(self,button):

        return self.buttons[button]
        


if __name__ == '__main__':



    buttons = {'ChannelA Ein': 12323}

    devices = {'Steckdosen': buttons}

    with open('exampleData.yml', 'w') as outfile:
        yaml.dump(devices, outfile, default_flow_style=False)


    with open('exampleData.yml', 'r') as f:
        devices2 = yaml.load(f)


    Four33 = Fo

    IPS()