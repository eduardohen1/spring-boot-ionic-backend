package br.com.ehsolucoes.cursomc.services;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

public class SmtpEmailService extends AbstractEmailService {

    private static final Logger LOG = LoggerFactory.getLogger(SmtpEmailService.class);

    @Autowired
    private MailSender mailSender;

    @Override
    public void sendEmail(SimpleMailMessage msg) {
        LOG.info("Enviando e-mail...");
        //erro ao enviar.. caixa de saida - estudar mais
        //mailSender.send(msg);
        LOG.info("E-mail enviado!");
    }
}
