#!/usr/bin/python

import imaplib
from cred_mail import *

conn = imaplib.IMAP4_SSL(SERVER,993)
conn.login(USER,PASSWORD)
conn.select("INBOX")
print(len(conn.search(None,'ALL')[1][0].split()))
