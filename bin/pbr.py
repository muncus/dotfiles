#!/usr/bin/env python
#
# simple command to send note via PushBullet (http://pushbullet.com).
# Requires the installation of the pushbullet.py module from
# https://github.com/randomchars/pushbullet.py
#
# Author: Marc Dougherty <muncus@gmail.com>

import os
import pushbullet
import yaml

from optparse import OptionParser

parser = OptionParser()
parser.add_option("-t", "--title", dest="title", help="title for note")
parser.add_option("-b", "--body", dest="body", help="body for note")

(options, args) = parser.parse_args()

CONFIG_FILE = os.path.expanduser('~/.pushbullet')

config = {}

def get_api_key():
  if config.has_key('api_key'):
    return config["api_key"]
  return None


if os.path.exists(CONFIG_FILE):
  config = yaml.load(open(os.path.expanduser('~/.pushbullet')))


pb = pushbullet.PushBullet(get_api_key())
#TODO: expand this to be a particular device, or all, controlled by flags.
device = pb.devices[0]
device.push_note(options.title, options.body)

