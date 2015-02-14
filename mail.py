from email.mime.text import MIMEText
from datetime import date
import smtplib

SMTP_SERVER = "smtp.gmail.com"
SMTP_PORT = 587


SMTP_USERNAME = "cengfan.us@gmail.com"
SMTP_PASSWORD = "1194w30thstapt2"

EMAIL_FROM = "maoze365@gmail.com"

def send_email(EMAIL_TO, EMAIL_SUBJECT, BODY):
    msg = MIMEText(BODY)
    msg['Subject'] = EMAIL_SUBJECT
    msg['To'] = EMAIL_TO
    msg['From'] = EMAIL_FROM
    errors = ""
    try:
        mail = smtplib.SMTP(SMTP_SERVER, SMTP_PORT)
        mail.starttls()
        mail.login(SMTP_USERNAME, SMTP_PASSWORD)
        mail.sendmail(EMAIL_FROM, EMAIL_TO, msg.as_string())
    except:
        errors = "Email send faild"
    mail.quit()
    return errors

if __name__=='__main__':
    print send_email("maoze365@gmail.com", "TEST for email setting", "This is the test<hr><p>23")
