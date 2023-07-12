import imaplib
import email
from email.header import decode_header
import re
from bs4 import BeautifulSoup


import time

def fetch_otp(host, username, password, folder, subject, delay=8):
    # ... your existing code

    time.sleep(delay)  # Pause the execution for 'delay' seconds

    mail = imaplib.IMAP4_SSL(host)
    mail.login(username, password)
    mail.select(folder)

    result, data = mail.uid('search', None, '(SUBJECT "' + subject + '")')
    email_uids = data[0].split()

    for email_uid in reversed(email_uids):
        result, data = mail.uid('fetch', email_uid, '(BODY.PEEK[])')

        raw_email = data[0][1]
        email_message = email.message_from_bytes(raw_email)

        if email_message.is_multipart():
            for part in email_message.walk():
                if part.get_content_type() == 'text/plain':
                    email_content = part.get_payload(decode=True)
                    email_content = email_content.decode()
                elif part.get_content_type() == 'text/html':
                    soup = BeautifulSoup(part.get_payload(decode=True), "html.parser")
                    email_content = soup.get_text()

        else:
            email_content = email_message.get_payload(decode=True)
            email_content = email_content.decode()

        # Extract OTP using regex
        match = re.search(r"รหัส OTP\s*:\s*([0-9]+)", email_content)
        if match is not None:
            otp = match.group(1)
            return otp

    raise ValueError("No OTP found in the email content.")

