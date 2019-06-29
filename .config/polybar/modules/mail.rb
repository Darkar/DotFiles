#!/usr/bin/ruby
require 'net/imap'
# Stuff you can set
## If you can't figure out the first three, give up now
IMAP_USER = "jeremy@magnan.one"
IMAP_PASS = "Monster842"
IMAP_SERVER = "ex2.mail.ovh.net"
## Are we using SSL?
SSL = true
## What port? Usually 993 for SSL
PORT = 993
# Use different method for calculating total messages on MS-Exchange
IS_EXCHANGE = true
## Which folder? Normally "INBOX" or "[Gmail]/All Mail" (for gmail)
IMAP_FOLDER = "INBOX"
## Maximum number of messages we want to show
MAX_MSG = 5 # Not yet implemented
## Output with conky formatting?
CONKYFIED = false
## Color choices
NEW_COLOR = "green"
SENDER_COLOR = "grey"
SUBJ_COLOR = "white"

def conkify(text,color)
    text = "${color #{color}}#{text} $color"
    return text
end

def get_messages(conn)
    imap = conn
    imap.search(["NOT", "DELETED", "UNSEEN"]).each do |message_id|
        envelope = imap.fetch(message_id, "ENVELOPE")[0].attr["ENVELOPE"]
        from, subject = envelope.from[0].name == nil ? envelope.from[0].mailbox : envelope.from[0].name, envelope.subject
        CONKYFIED == true ? puts("#{conkify(from,SENDER_COLOR)} $alignr#{conkify(subject,SUBJ_COLOR)}") : puts("")
    end
end

imap = Net::IMAP.new(IMAP_SERVER,port = PORT, usessl = SSL)
imap.login(IMAP_USER,IMAP_PASS)
imap.examine(IMAP_FOLDER)
IS_EXCHANGE == true ? counts = imap.search(["NOT", "DELETED", "UNSEEN"]).size : counts = imap.status(IMAP_FOLDER, ["UNSEEN"])["UNSEEN"]
counts > 0 ? ( puts("#{CONKYFIED == true ? conkify(counts,NEW_COLOR) : counts}"); get_messages(imap) ) : ( puts("0") )
imap.disconnect
exit