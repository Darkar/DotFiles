#!/usr/bin/python

import imaplib
from cred_mail import *

try:
	conn = imaplib.IMAP4_SSL(SERVER, PORT)
	conn.login(USER,PASSWORD)
	conn.select("INBOX")
	print(len(conn.search(None,'ALL')[1][0].split()))
except Exception as Ex:
    print(Ex)
