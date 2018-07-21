#!/usr/bin/python

import base64
import os

# the fernet key in binary
b_key = os.urandom(32)

# signing key is the first 16 bytes of the fernet key
b_key[:16]

# encrypting key is the last 16 bytes of the fernet key
b_key[16:] 

# base64 encoded fernet key
key = base64.urlsafe_b64encode(b_key)

print(key)
