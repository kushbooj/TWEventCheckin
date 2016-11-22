class Emailer < ActionMailer::Base

  def send_mail(email, qrcode)
    attachments['qrcode.png'] = qrcode
    mail(to: email, subject: 'Event QR Code', body: 'Scan the code for hassle free entry in', from: 'tweventcheckin@thoughtworkscom')
  end
end
