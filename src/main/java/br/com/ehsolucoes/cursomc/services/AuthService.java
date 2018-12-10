package br.com.ehsolucoes.cursomc.services;

import br.com.ehsolucoes.cursomc.domain.Cliente;
import br.com.ehsolucoes.cursomc.repositories.ClienteRepository;
import br.com.ehsolucoes.cursomc.services.exceptions.ObjectNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Random;

@Service
public class AuthService {

    @Autowired
    private ClienteRepository clienteRepository;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    private EmailService emailService;

    private Random rand = new Random();

    public void sendNewPassword(String email){
        Cliente cliente = clienteRepository.findByEmail(email);
        if(cliente == null){
            throw new ObjectNotFoundException("E-mail não encontrado");
        }
        String newPass = newPassword();
        cliente.setSenha(bCryptPasswordEncoder.encode(newPass));
        clienteRepository.save(cliente);
        emailService.sendNewPasswordEmail(cliente, newPass);
    }

    private String newPassword() {
        char[] vet = new char[10];
        for(int i=0; i<10; i++){
            vet[i] = randomChar();
        }
        return new String(vet);
    }

    private char randomChar() {
        int opt = rand.nextInt(3);
        char resposta = (char) 1;
        switch (opt){
            case 0:
                //gera um dígito
                resposta = (char) (rand.nextInt(10)+48);
                break;
            case 1:
                //gera letra maiúscula
                resposta = (char) (rand.nextInt(26)+65);
                break;
            case 3:
                //letra minúscula
                resposta = (char) (rand.nextInt(26)+97);
                break;
        }
        return resposta;
    }

}
